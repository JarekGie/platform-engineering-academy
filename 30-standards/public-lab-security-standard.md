---
title: Standard bezpieczeństwa labów w publicznym repo
vault_type: academy
domain: shared-concept
classification: public
llm_exposure: allowed
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-15
updated: 2026-07-15
tags: [standard, security, public-repo, secrets, iac]
---

## Cel / kontekst

To repo jest **publiczne**. Wszystko, co śledzone w gicie, jest natychmiast czytelne dla świata
(ludzie, crawlery, trening modeli) i pozostaje w historii nawet po usunięciu. Ten standard definiuje
twardą granicę: **co nigdy nie może trafić do repo** i jakie mechanizmy to egzekwują. Powiązane:
[[lab-code-standard]], [[decision-log]] (ADR o napięciu public/internal).

Reguła nadrzędna: `classification` i `llm_exposure` **nie są granicą poufności po publikacji** —
chronią jedynie przekazywanie treści do narzędzi LLM. Granicą poufności jest decyzja „czy to w ogóle
wchodzi do publicznego repo". Jeśli coś nie może być publiczne — nie commituj tego tutaj.

## Treść

### Zakazane artefakty (nigdy w repo)
- sekrety, tokeny, hasła, klucze API;
- dane klientowskie i firmowe (w tym Makolab i projektów zawodowych);
- rzeczywiste identyfikatory kont (AWS account ID), ARN-y produkcyjne;
- prywatne domeny/endpointy, wewnętrzne adresy;
- `kubeconfig` i konteksty klastrów;
- pliki stanu Terraform (`*.tfstate`, `*.tfstate.*`);
- lokalne `*.tfvars` / `*.tfvars.json` z realnymi wartościami;
- klucze i certyfikaty (`*.pem`, `*.key`, `*.p12`, `*.pfx`);
- pliki `.env` z realnymi wartościami;
- vault password files, odszyfrowane sekrety Ansible, retry files.

### Co jest dozwolone i ŚLEDZONE (dowód kompetencji)
- pliki przykładowe: `terraform.tfvars.example`, `*.tfvars.json.example`, `.env.example`,
  `inventory.example.yml`;
- lockfile i manifesty zależności: `.terraform.lock.hcl`, `go.mod`, `go.sum`,
  `requirements.txt`, `pyproject.toml`, `Chart.lock`;
- kod z **placeholderami** zamiast realnych wartości.

### Placeholdery — konwencja
Zamiast realnych danych używamy jawnych placeholderów: `123456789012` (account ID),
`example.com` (domena), `REGION_X`, `KLIENT_A`, `${var.name}`. Placeholder ma być rozpoznawalny
jako placeholder, nie wyglądać jak realna wartość.

### Sanityzacja logów i outputów
Zrzuty z `terraform output`, logi, screeny do `evidence.md` — **po sanityzacji**: bez account ID,
ARN-ów, IP, hostów, tokenów. Jeśli sanityzacja pozbawia dowód sensu — opisz słownie zamiast wklejać.

### Mechanizmy egzekwujące
1. **`.gitignore`** — blokuje typowe wycieki (state, tfvars, kubeconfig, klucze, `.env`), przy czym
   `*.example` i lockfile pozostają śledzone.
2. **`bin/validate-vault.sh`** — wykrywa zakazane artefakty **śledzone** w repo (fail, nie warning).
3. **CI `secret-scan`** — gitleaks na całym repo i pełnej historii, blocking.
4. **Skan lokalny przed pierwszym commitem kodu** — obowiązkowy (patrz niżej).
5. **OIDC zamiast długoterminowych kluczy** — CI łączy się z chmurą przez OIDC; żadnych statycznych
   AWS access keys w repo ani w sekretach używanych do `apply`. (Na obecnym etapie: brak `plan`/apply.)

### Skan lokalny przed pierwszym commitem kodu (obowiązkowy)
```bash
bin/validate-vault.sh                 # zakazane artefakty + kontrakt notatek
git ls-files | grep -E '\.tfstate|\.tfvars$|kubeconfig|\.pem$|\.key$|(^|/)\.env$' || echo "OK: brak"
# jeśli dostępny lokalnie:
gitleaks detect --no-banner --redact   # GAP, jeśli gitleaks niezainstalowany — nie pomijaj cicho
```

## Uwagi

Brak opcjonalnego narzędzia (np. gitleaks lokalnie) to **jawny GAP**, nie cichy sukces — odnotuj
i uruchom skan w CI. Ten standard nie zastępuje zdrowego rozsądku: w razie wątpliwości „czy to
bezpieczne publicznie" — nie publikuj i skonsultuj.

Powiązane: [[lab-code-standard]], [[lab-code-review-standard]], [[decision-log]].
