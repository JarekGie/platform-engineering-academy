---
title: Standard kodu labów (uruchamialny kod w vaultcie)
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
tags: [standard, lab, code, iac, monorepo]
---

## Cel / kontekst

Ten vault jest **monorepo**: łączy wiedzę, decyzje, implementację i dowody kompetencji w jednym
publicznym repozytorium-wizytówce. Od teraz lab może zawierać nie tylko notatkę, ale też
**realny, uruchamialny kod** (Terraform, Terragrunt, Ansible, Kubernetes, Helm, Bash, opcjonalnie
Python/Go) oraz CI/CD walidujące ten kod. Standard opisuje, jak taki lab wygląda i kiedy kod
gdzie trafia. Powiązane: [[public-lab-security-standard]], [[lab-code-review-standard]],
[[evidence-register]], [[decision-log]].

Fundament: kod labów jest **częścią procesu nauki, nie produkcyjnym frameworkiem**. Ma być
czytelny, uruchamialny i bezpieczny w publicznym repo — nie „gotowy na produkcję".

## Treść

### 1. Kiedy kod trafia do `03-labs/`
Gdy powstaje w ramach nauki jako ćwiczenie domykające krok pipeline
(`Theory → Lab → Implementation → Validation → Evidence`). Lab to samodzielny artefakt: da się
go zrozumieć i uruchomić bez czytania całego vaulta.

### 2. Kiedy artefakt trafia do `08-real-projects/`
Gdy to rzeczywisty problem/wdrożenie (nie ćwiczenie), integrujący wiele kompetencji. Real project
odwołuje się do modułów i produkuje dowód końcowy (patrz `templates/real-project.md`).

### 3. Kiedy coś przestaje być labem (wydzielenie do osobnego repo)
Gdy artefakt: (a) zyskuje własny cykl życia i wersjonowanie, (b) jest realnie reużywany jako
moduł/biblioteka przez inne projekty, (c) wymaga własnego release'u i CI cięższego niż walidacja.
Wydzielenie to **udokumentowana decyzja** (ADR w [[decision-log]]); vault linkuje wtedy do repo
+ przypięty commit SHA. Do tego czasu — kod zostaje w monorepo.

### 4. Struktura katalogów laba (adaptacyjna)
Katalog laba: `03-labs/<lab-id>/`. Nie tworzymy pustych katalogów (git ich nie śledzi) — katalog
pojawia się, gdy ma zawartość.

Minimalny lab (np. Terraform):
```
03-labs/<lab-id>/
├── README.md          # techniczny, public-safe, czytelny bez Obsidiana
├── lab.md             # notatka Obsidiana (pełny frontmatter)
├── infra/terraform/   # kod
├── evidence.md        # dowód wykonania
└── Makefile           # wspólny interfejs operatora
```

Rozbudowany lab platformowy dokłada wg potrzeb:
```
├── architecture.md ├── decisions.md ├── lessons-learned.md ├── cost.md
├── infra/{terraform,terragrunt,ansible}/
├── platform/{kubernetes,helm,argocd}/
├── apps/{python,go}/
├── observability/ ├── security/ ├── tests/ ├── scripts/ ├── examples/ └── docs/
```
Zasada: **żaden lab nie musi mieć wszystkich katalogów** — tylko te, które faktycznie zawierają pracę.

### 5. Wymagania dla `README.md` (techniczny)
Dokument dla inżyniera/rekrutera, czytelny bez Obsidiana, bez frontmattera vaulta. Zawiera: cel,
architekturę, wymagania, uruchomienie, walidację, **koszt**, **teardown**, ograniczenia,
bezpieczeństwo. Wzorzec: `templates/lab-readme.md`.

### 6. Wymagania dla `evidence.md`
Rozdziela **deklarację operatora**, **fakt zweryfikowany** i **GAP** (brak dowodu). Wskazuje
ścieżkę do kodu + commit SHA + wynik walidacji (CI, `terraform validate`, lint, security scan).
Rejestruje `evidence_id` w [[evidence-register]]. Nie używamy sformułowania „repo działa" bez dowodu.

### 7. Terraform
Na początku prosty i czytelny, bez przesadnej modularizacji. Wersje providerów przypięte,
`.terraform.lock.hcl` **śledzony**. Backend bez wpisanych na sztywno danych środowiskowych.
Brak sekretów w `variables`, brak rzeczywistych identyfikatorów kont. Zasoby otagowane.
README zawiera **teardown**.

### 8. Terragrunt
Dodawany **dopiero** przy realnym problemie: wiele środowisk, duplikacja backendów/providerów,
powtarzalna konfiguracja. Nie dodajemy go „żeby wyglądało bardziej senior". Migracja
Terraform → Terragrunt to udokumentowana decyzja ([[decision-log]]) i osobny dowód.

### 9. Ansible
Playbooki idempotentne. Sekrety wyłącznie przez vault/ext-secrets, nigdy plaintext. Inventory
z danymi wrażliwymi poza repo; w repo tylko `inventory.example.yml`. Preferowany `ansible-lint`.

### 10. Kubernetes i Helm
Manifesty deklaratywne, bez sekretów w jawnym tekście. Helm chart z przypiętymi wersjami;
`Chart.lock` śledzony. Walidacja: `helm lint`, `kubeconform`/`kubeval`, policy scan.

### 11. Python i Go
Python: `ruff`, `mypy` (gdy używane typowanie), `pytest`; `pyproject.toml`/`requirements.txt`
**śledzone**. Go: `gofmt`, `go vet`, `go test`; `go.mod`/`go.sum` **śledzone**.

### 12. CI/CD
Monorepo CI jest **filtrowane ścieżkami** — zmiana Markdown nie uruchamia CI Terraform.
- `docs` — waliduje **tylko zmienione** pliki Markdown (markdownlint lenient + `bin/validate-vault.sh`);
  pełny skan historycznego korpusu to osobne, przyszłe zadanie.
- `secret-scan` — gitleaks na całym repo i pełnej historii, blocking.
- `terraform` — dla zmienionych katalogów z `.tf`: `fmt -check` → `init -backend=false` → `validate`
  → `tflint` → security scan. Bez `plan`/apply/AWS; OIDC + plan = przyszły krok.
- Terragrunt/Ansible/Helm/Python/Go — workflow dochodzą **wraz z pojawieniem się danego kodu**,
  nie „na zapas". `pre-commit` wprowadzamy z pierwszym realnym Terraformem, gdy znane są potrzebne hooki.

### 13. Bezpieczeństwo publicznego repo
Obowiązuje [[public-lab-security-standard]] — twarda lista zakazanych artefaktów i reguła:
wszystko śledzone w repo musi być **public-safe**.

### 14. Koszt i teardown
Każdy lab tworzący zasoby chmurowe ma `cost.md` (założenia, koszt godzinowy/miesięczny, najdroższe
zasoby, ryzyko pozostawienia) i procedurę teardownu w README oraz target `destroy` w `Makefile`.

### 15. Review
Każdy istotny kod przechodzi review wg [[lab-code-review-standard]] (findings BLOCKER/HIGH/…,
ocena poziomu, warunki wejścia na kolejny poziom).

### 16. Kryteria ukończenia laba (Definition of Done)
- kod uruchamialny; walidacja przechodzi (CI zielone dla zmienionych plików);
- `README.md` kompletny (uruchomienie + walidacja + teardown + koszt + bezpieczeństwo);
- `evidence.md` z `evidence_id`, SHA i wynikiem walidacji, wpis w [[evidence-register]];
- brak zakazanych artefaktów (public-safe);
- lekcje wyciągnięte zapisane w `lessons-learned.md`.

## Uwagi

### Model laba „grandfathered"
Laby sprzed tego standardu są **płaskimi notatkami** (`03-labs/lab-*.md`) i **pozostają ważne** bez
przenoszenia. Nie tworzymy dwóch konkurencyjnych źródeł prawdy dla tego samego laba: albo notatka
płaska (legacy), albo katalog `03-labs/<lab-id>/`. Nowe laby używają modelu katalogowego. Ewentualna
migracja legacy → katalog to osobna, udokumentowana decyzja, nie automatyczny porządek.

Powiązane: [[03-labs]], [[evidence-register]], [[decision-log]], [[public-lab-security-standard]],
[[lab-code-review-standard]].
