#!/usr/bin/env bash
# validate-vault.sh — minimalny walidator vaulta (frontmatter + wiki-links + artefakty).
#
# Zakres (świadomie minimalny, patrz 30-standards/lab-code-standard.md):
#   1. obowiązkowe pola frontmattera        (kontrakt _system/AGENTS.md — nie nowy schemat)
#   2. dozwolone wartości enumów            (classification, llm_exposure, domain, ...)
#   3. podstawowe wiki-links                (czy [[cel]] rozwiązuje się w vaultcie)
#   4. duplikaty identyfikatorów            (lab_id, evidence_id we frontmatterze)
#   5. zakazane artefakty śledzone w repo   (tfstate, tfvars, kubeconfig, klucze, .env)
#
# Użycie:
#   bin/validate-vault.sh                 # pełny skan wszystkich *.md
#   bin/validate-vault.sh a.md b.md       # tylko podane pliki (CI: zmienione pliki)
#
# Kody wyjścia: 0 = OK, 1 = błędy walidacji, 2 = błąd użycia.
# Reguła GAP: brak narzędzia/danych nie jest cichym sukcesem — wypisujemy "GAP:".

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2

ERRORS=0
err() { printf 'ERROR  %s\n' "$1" >&2; ERRORS=$((ERRORS + 1)); }
gap() { printf 'GAP    %s\n' "$1" >&2; }
ok()  { printf 'OK     %s\n' "$1"; }

# --- Dozwolone wartości (źródło: _system/AGENTS.md + templates/note-template.md) ---
ENUM_vault_type="team learning client aiops compliance single practice career academy"
ENUM_classification="public internal confidential restricted"
ENUM_llm_exposure="forbidden allowed allowed_anonymized allowed_internal_only"
ENUM_notebooklm_source="false candidate approved rejected"
ENUM_podcast_export="forbidden allowed allowed_after_review"
ENUM_compliance_review="not_required required approved rejected"
ENUM_domain="client-work internal-ops compliance learning aiops shared-concept private-rnd"
REQUIRED_KEYS="title vault_type domain classification llm_exposure notebooklm_source podcast_export compliance_review source_of_truth created updated tags"

in_set() { case " $2 " in *" $1 "*) return 0 ;; *) return 1 ;; esac; }

# Wszystkie notatki vaulta (do indeksu linków i duplikatów).
# Wykluczamy .claude/ — pliki SKILL.md mają własny schemat frontmattera (skill_name/mandatory/...),
# NIE są notatkami vaulta i nie podlegają kontraktowi note-frontmatter z AGENTS.
ALL_MD="$(find . -type f -name '*.md' \
  -not -path './.git/*' -not -path './.obsidian/*' -not -path './.claude/*' 2>/dev/null | sort)"

# Cel walidacji frontmattera/linków: argumenty albo (brak argumentów) wszystkie pliki
if [ "$#" -gt 0 ]; then
  TARGETS="$*"
else
  TARGETS="$ALL_MD"
fi

# --- Indeks rozwiązywania wiki-links: basename bez .md ∪ tytuły ∪ nazwy katalogów ---
build_link_index() {
  # basenames
  printf '%s\n' "$ALL_MD" | while read -r f; do
    [ -n "$f" ] && basename "$f" .md
  done
  # tytuły z frontmattera
  printf '%s\n' "$ALL_MD" | while read -r f; do
    [ -z "$f" ] && continue
    awk 'NR==1&&$0=="---"{f=1;next} f&&$0=="---"{exit} f&&/^title:/{sub(/^title:[[:space:]]*/,"");print;exit}' "$f"
  done
  # nazwy katalogów (linki typu [[03-labs]], [[07-homelab]])
  find . -type d -not -path './.git/*' -not -path './.obsidian/*' 2>/dev/null \
    | sed 's#.*/##'
}
LINK_INDEX="$(build_link_index | sed '/^$/d' | sort -u)"
# Indeks ścieżkowy: pełne ścieżki .md (bez ./) — dla linków typu [[07-homelab/security/vault]]
PATH_INDEX="$(printf '%s\n' "$ALL_MD" | sed 's#^\./##' | sed '/^$/d' | sort -u)"

link_resolves() {
  # 1) basename / tytuł / nazwa katalogu
  printf '%s\n' "$LINK_INDEX" | grep -qxF "$1" && return 0
  # 2) link ścieżkowy: dopasuj plik <cel>.md albo .../<cel>.md
  printf '%s\n' "$PATH_INDEX" | grep -qE "(^|/)$(printf '%s' "$1" | sed 's/[.[\*^$/]/\\&/g')\.md$" && return 0
  return 1
}

# --- Ekstrakcja bloku frontmattera ---
frontmatter() {
  awk 'NR==1&&$0=="---"{f=1;next} f&&$0=="---"{exit} f{print}' "$1"
}
fm_value() { # $1 blok, $2 klucz — odcina wartość, komentarz YAML (" #...") i białe znaki
  printf '%s\n' "$1" | grep -E "^$2:" | head -1 \
    | sed -E "s/^$2:[[:space:]]*//" | sed -E 's/[[:space:]]+#.*$//' | sed -E 's/[[:space:]]+$//'
}
has_key() { printf '%s\n' "$1" | grep -qE "^$2:"; }

echo "== Walidacja frontmattera i wiki-links =="

for f in $TARGETS; do
  [ -f "$f" ] || { err "$f — plik nie istnieje"; continue; }
  case "$f" in *.md) ;; *) continue ;; esac
  case "$f" in ./.claude/*|.claude/*) continue ;; esac

  first="$(head -1 "$f")"
  if [ "$first" != "---" ]; then
    # Brak frontmattera = plik nienotatkowy (README techniczne itp.) — pomijamy pola.
    # Sprawdzamy tylko wiki-links (jeśli jakieś są).
    :
  else
    fm="$(frontmatter "$f")"
    # 1. obowiązkowe pola
    for k in $REQUIRED_KEYS; do
      has_key "$fm" "$k" || err "$f — brak obowiązkowego pola frontmattera: $k"
    done
    # 2. enumy
    for k in vault_type classification llm_exposure notebooklm_source podcast_export compliance_review domain; do
      if has_key "$fm" "$k"; then
        v="$(fm_value "$fm" "$k")"
        eval "allowed=\$ENUM_$k"
        # notebooklm_source/false itp. mogą być bez cudzysłowu — normalizujemy
        v="${v%\"}"; v="${v#\"}"
        if [ -n "$v" ] && ! in_set "$v" "$allowed"; then
          err "$f — pole $k ma niedozwoloną wartość: '$v' (dozwolone: $allowed)"
        fi
      fi
    done
  fi
done

# 3. wiki-links — jedna pętla, która drukuje i zlicza (process substitution, bez subshell-pipe)
for f in $TARGETS; do
  [ -f "$f" ] || continue
  case "$f" in *.md) ;; *) continue ;; esac
  case "$f" in ./.claude/*|.claude/*) continue ;; esac
  while read -r target; do
    [ -z "$target" ] && continue
    # pomiń jawne placeholdery w szablonach/README: [[<...>]], [[...]]
    case "$target" in *"<"*|*">"*|*"..."*) continue ;; esac
    if ! link_resolves "$target"; then
      err "$f — nierozwiązany wiki-link: [[$target]]"
    fi
  done < <(awk '/^[[:space:]]*```/{fence=!fence; next} !fence' "$f" 2>/dev/null | sed 's/`[^`]*`//g' | grep -oE '\[\[[^]]+\]\]' | sed -E 's/^\[\[//; s/\]\]$//; s/\\//g; s/\|.*$//; s/#.*$//; s/[[:space:]]+$//')
done

# --- 4. Duplikaty identyfikatorów (zawsze w pełnym zakresie repo) ---
# lab_id musi być UNIKALNY per lab. Notatki tego samego laba (lab.md, architecture.md, ...)
# legalnie współdzielą lab_id — duplikat = ten sam lab_id w DWÓCH różnych katalogach 03-labs/<X>/.
echo "== Duplikaty identyfikatorów (lab_id unikalny per katalog laba) =="
pairs="$(printf '%s\n' "$ALL_MD" | while read -r f; do
  [ -z "$f" ] && continue
  case "$f" in ./03-labs/*/*) ;; *) continue ;; esac
  [ "$(head -1 "$f")" = "---" ] || continue
  fm="$(frontmatter "$f")"
  printf '%s\n' "$fm" | grep -qE '^lab_id:' || continue
  lid="$(fm_value "$fm" lab_id)"
  [ -z "$lid" ] && continue
  labroot="$(printf '%s' "$f" | sed -E 's#^\./##; s#^(03-labs/[^/]+)/.*#\1#')"
  printf '%s\t%s\n' "$lid" "$labroot"
done | sort -u)"
dups="$(printf '%s\n' "$pairs" | sed '/^$/d' | awk -F'\t' '{c[$1]++} END{for(k in c) if(c[k]>1) print k}')"
if [ -n "$dups" ]; then
  printf '%s\n' "$dups" | while read -r d; do
    [ -n "$d" ] && err "lab_id '$d' użyty w >1 katalogu laba (musi być unikalny per lab)"
  done
  ERRORS=$((ERRORS + $(printf '%s\n' "$dups" | sed '/^$/d' | wc -l | tr -d ' ')))
else
  ok "lab_id unikalne per katalog laba"
fi
gap "unikalność evidence_id (w treści i między labami) — egzekwuje rejestr [[evidence-register]], nie ten skrypt"

# --- 5. Zakazane artefakty ŚLEDZONE w repo ---
echo "== Zakazane artefakty (public-safe) =="
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  tracked="$(git ls-files)"
  # wzorce zakazane; wyjątki *.example obsługujemy filtrem
  bad="$(printf '%s\n' "$tracked" | grep -E '(\.tfstate$|\.tfstate\.|\.tfvars$|\.tfvars\.json$|(^|/)kubeconfig|\.kubeconfig$|\.pem$|\.key$|\.p12$|\.pfx$|(^|/)\.env$)' \
        | grep -vE '\.example$' || true)"
  if [ -n "$bad" ]; then
    printf '%s\n' "$bad" | while read -r b; do err "zakazany artefakt śledzony w repo: $b"; done
    ERRORS=$((ERRORS + $(printf '%s\n' "$bad" | sed '/^$/d' | wc -l | tr -d ' ')))
  else
    ok "brak zakazanych artefaktów wśród plików śledzonych"
  fi
else
  gap "git niedostępny — nie sprawdzono, które zakazane artefakty są ŚLEDZONE (uruchom w repo git)"
fi

echo "== Podsumowanie =="
if [ "$ERRORS" -gt 0 ]; then
  printf 'FAIL: %d błędów walidacji\n' "$ERRORS" >&2
  exit 1
fi
ok "walidacja przeszła (0 błędów)"
