---
title: Context-pack — vault platform-engineering-academy: zastosowania i możliwości
vault_type: academy
domain: shared-concept
classification: internal
llm_exposure: allowed
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-07-12
updated: 2026-07-15
tags: [chatgpt, context-pack, shared-concept, vault, framework, code-review, iac, repo-strategy]
---

Paczka kontekstu dla ChatGPT. Buduje ją [[context-pack]] wyłącznie z treści dopuszczonej
do narzędzia zewnętrznego (patrz [[CHATGPT]] i [[LLM_CONTEXT_BOUNDARY_CONTRACT]]).
`source_of_truth: false` — prawda zostaje w notatkach vaulta, nie tutaj.

Uwaga o granicy ekspozycji: notatki operacyjne opisujące ten vault (`start-here`, `now`,
`roadmap`, moduły) mają `llm_exposure: allowed_internal_only`, a pliki `_system/` i `README`
nie mają frontmattera (traktowane jak `forbidden`). Dlatego ta paczka NIE cytuje ich treści.
Zawiera wyłącznie **opis frameworku jako konceptu** (domena `shared-concept`) — generyczną,
publikowalną wiedzę o strukturze i zasadach działania vaulta, bez danych wrażliwych.

## Cel paczki

Dać ChatGPT pełny, samowystarczalny kontekst o tym, **czym jest ten vault, do czego służy
i co potrafi**, tak aby mógł: (a) wyjaśniać jego działanie, (b) proponować sposoby pracy
i usprawnienia, (c) pomagać planować naukę i treści — bez dostępu do wnętrza vaulta i bez
naruszania granic ekspozycji.

**Aktualizacja 2026-07-15 — nowy zakres.** Operator chce, żeby vault (jako **publiczne repo /
wizytówka** dokumentująca jego wiedzę) miał **miejsce na kod**: Terraform, Terragrunt, Ansible,
ewentualnie Python i Go, a na pewno CI/CD. W tym procesie AI ma pełnić rolę **senior code
reviewera**: dawać konstruktywny feedback i oceniać poziom pracy jak doświadczony senior.
Ta paczka zawiera więc dodatkowo: (d) **kontrakt review** (jak oceniać kod i seniority),
(e) **decyzję architektoniczną** — czy IaC pod laba trzymać w tym vaultcie (monorepo),
czy w osobnym repo, z rzetelnymi argumentami za i przeciw dla obu wariantów.

## Domena (jedna paczka = jedna domena)

`shared-concept`

## Materiały źródłowe (sprawdzone llm_exposure)

| Źródło | llm_exposure | status w paczce |
|---|---|---|
| `vault-manifest.yaml` | brak frontmattera (metadane strukturalne) | uwzględnione tylko fakty strukturalne (nazwa, typ, wersja) |
| `README.md` | brak frontmattera → `forbidden` | POMINIĘTE — treść nie cytowana; użyto tylko publikowalnej listy katalogów |
| `_system/*` (AGENTS, CLAUDE, CHATGPT…) | brak frontmattera → `forbidden` | POMINIĘTE — treść nie cytowana; opisano jedynie istnienie i rolę kontraktów |
| [[start-here]] | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |
| [[now]] | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |
| [[roadmap]] | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |
| [[theory]] (moduł kubernetes) | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |
| Wymóg operatora (2026-07-15) o kodzie/repo | wejście operatora, niewrażliwe | włączone — cytat intencji, bez danych wrażliwych |
| Fakt strukturalny: brak kodu/IaC w repo (stan 2026-07-15) | metadana strukturalna | włączone — laby i homelab są dziś tylko w markdownie |

Do paczki nie weszło żadne ciało notatki `allowed`/`allowed_anonymized` — na tym etapie
vault zawiera treści szablonowe `allowed_internal_only`. Poniższy opis to oryginalna
synteza frameworku jako konceptu `shared-concept`, oparta na faktach strukturalnych
(nazwy katalogów, kontraktów, skilli, wersja frameworku), które są niewrażliwe.

## Kontekst

### Czym jest ten vault
`platform-engineering-academy` to vault Obsidian wygenerowany z **obsidian-vault-framework
(v0.6.0)**, typ **academy**. Służy jednej osobie/zespołowi do systematycznej nauki
inżynierii platformowej (Platform / DevOps / Cloud) i przekuwania jej w weryfikowalne dowody
kompetencji. Domyślna klasyfikacja: `internal`. Notatki: po polsku, standalone, nazwy w
kebab-case, powiązania przez `[[wiki-links]]`.

### Do czego służy (zastosowania)
1. **Ustrukturyzowana nauka kompetencji** wzdłuż pipeline'u:
   Roadmap → Theory → Lab → Assessment → Homelab → Evidence → Real Project.
   Każdy moduł (`02-modules/<temat>/`) przechodzi tę samą ścieżkę aż do dowodu kompetencji.
2. **Budowa "evidence register"** — rejestru dowodów (`05-evidence/`), które łączą teorię
   z realnymi projektami i certyfikacjami; każdy moduł celuje w konkretny `evidence_id`.
3. **Praca operacyjna z LLM w reżimie bezpieczeństwa** — vault jest zaprojektowany tak, by
   różne narzędzia AI (Claude Code, Codex, ChatGPT, NotebookLM) współpracowały z nim według
   twardych kontraktów ekspozycji danych.
4. **Produkcja treści pochodnych** — context-packi dla ChatGPT (`_chatgpt/`), źródła i
   podcasty dla NotebookLM (`90-reference/notebooklm/`), decyzje architektoniczne
   (`80-architecture/decision-log.md`), runbooki i post-mortemy (`40-runbooks/`).

### Struktura (mapa katalogów)
- `00-start-here/` — punkt wejścia i onboarding.
- `01-inbox/` — surowe wejścia do triażu; `01-roadmap/` — ścieżka nauki.
- `02-active-context/` — JEDEN bieżący kontekst pracy (`now.md`, `open-loops.md`).
- `02-modules/<temat>/` — moduły nauki (theory, resources, labs, assessment, evidence).
- `03-labs/` — praktyczne laby; `04-assessments/` — sprawdziany.
- `05-evidence/` — rejestr dowodów; `06-certifications/` — roadmapa certyfikacji.
- `07-homelab/` — architektura i ADR homelaba; `08-real-projects/` — projekty realne.
- `10-areas/ 20-projects/ 30-standards/ 40-runbooks/ 50-patterns/` — wiedza operacyjna.
- `80-architecture/` — architektura i `decision-log`; `90-reference/` — referencje + NotebookLM.
- `_system/` — kontrakty i polityki; `_chatgpt/` — paczki kontekstu; `templates/` — szablony.

### Kontrakty (co czyni vault "bezpiecznym dla AI")
Vault egzekwuje zasady przez pliki w `_system/`:
- **AGENTS** — nadrzędny kontrakt agenta: kontrakt notatki, obowiązkowy frontmatter,
  granice działania. Agent czyta go jako pierwszy.
- **CLAUDE / CODEX / CHATGPT** — kontrakty poszczególnych narzędzi.
- **LLM_CONTEXT_BOUNDARY_CONTRACT** — bramka `llm_exposure` z czterema poziomami:
  `forbidden` / `allowed_internal_only` / `allowed_anonymized` / `allowed`. Reguluje, co
  wolno przeczytać, zacytować, streścić i wyeksportować na zewnątrz. Brak/niejasne pole = `forbidden`.
- **DOMAIN_ISOLATION_CONTRACT** — zasada „jedna sesja LLM = jedna domena": nie miesza się
  danych klientowskich, osobowych, compliance, strategii i prywatnego R&D w jednym kontekście.
- **NOTEBOOKLM_CONTRACT / PODCAST_EXPORT_POLICY** — reguły dla NotebookLM i podcastów.
- **COMPLIANCE_REVIEW_CONTRACT / MANDATORY_WORKFLOW_CONTRACT** — przegląd compliance i
  egzekwowanie obowiązkowych kroków workflow (skille jako twarde kontrakty, nie sugestie).

### Model klasyfikacji (frontmatter każdej notatki)
- `classification`: public | internal | confidential | restricted
- `llm_exposure`: forbidden | allowed | allowed_anonymized | allowed_internal_only
- `domain`: client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd
- plus: `notebooklm_source`, `podcast_export`, `compliance_review`, `source_of_truth`.
Twarde reguły: `restricted` nigdy nie opuszcza vaulta; `confidential` wymaga
`compliance_review: approved` przed eksportem.

### Możliwości operacyjne (skille = automatyzacje workflow)
Vault ma lokalne skille w `.claude/skills/` (egzekwowane jako kontrakty):
- **start-day** — start sesji: odczyt `now.md`, deklaracja jednej domeny, przegląd inboxu,
  branch `<operator>/<YYYY-MM-DD>`.
- **switch-project** — jawna zmiana domeny z zapisem stanu (bez mieszania domen).
- **end-day** — porządkowanie inboxu, aktualizacja `updated:`, commit sesji.
- **decision-note** — dopisanie ADR do `decision-log`.
- **incident-note** — notatka incydentu / post-mortem (RCA, timeline, follow-up).
- **notebooklm-export** — zebranie źródeł oznaczonych `notebooklm_source: approved`.
- **context-pack** — budowa paczki kontekstu dla ChatGPT (ten mechanizm).

### Zasady współpracy z narzędziami AI
- **Claude Code / Codex** — narzędzia wewnętrzne: mogą pracować na `allowed_internal_only`.
- **ChatGPT / NotebookLM** — narzędzia zewnętrzne: konsumują WYŁĄCZNIE gotowe paczki z
  `_chatgpt/context-packs/` (dla ChatGPT), nigdy notatek bezpośrednio.
- Wynik z narzędzia zewnętrznego wraca do vaulta jako notatka zgodna z kontraktem; surowy
  wynik nie jest źródłem prawdy — `source_of_truth` zostaje w vaultcie.

## Nowy zakres: kod w portfolio

### Czego chce operator
Vault jest **publicznym repo** i ma być **wizytówką dokumentującą wiedzę**. Do dziś (2026-07-15)
zawiera wyłącznie notatki markdown — laby (`03-labs/`), homelab (`07-homelab/`) i moduły
(`02-modules/`) są **opisane słownie, ale nie zawierają wykonywalnego kodu ani IaC**. Operator
chce dołożyć miejsce na realny kod:
- **Terraform + Terragrunt** — IaC i warstwa DRY/multi-env nad Terraformem;
- **Ansible** — konfiguracja/provisioning;
- **Python i Go** (opcjonalnie) — narzędzia, automatyzacje, drobne serwisy;
- **CI/CD** — na pewno (pipeline dla powyższego).

Rola AI w tym procesie: **senior code reviewer** — konstruktywny feedback i ocena poziomu pracy.

### Napięcie do rozstrzygnięcia najpierw: „publiczne repo" vs `classification: internal`
To trzeba wyjaśnić, zanim wleci kod. Manifest ma `default_classification: internal`, a notatki
operacyjne (`now`, `roadmap`, moduły) są `allowed_internal_only`. Jeśli repo jest **naprawdę
publiczne**, to `internal` i `allowed_internal_only` **przestają być realną kontrolą** — treść
jest już czytelna dla całego świata (ludzie, crawlery, trening modeli). Bramka `llm_exposure`
chroni tylko przed *ręcznym karmieniem* zewnętrznego LLM-a; nie cofa faktu publikacji w git.
Dwa czyste wyjścia (do wyboru przez operatora, nie zakładam za niego):
- **A. Repo publiczne = tylko treść public-safe.** Zreklasyfikować to, co ma być widoczne, na
  `public`/`shared-concept`, a `internal` trzymać w osobnym, prywatnym repo/branchu.
- **B. Split repo.** Publiczny „showcase vault" (portfolio) + prywatny „working vault" (surowa
  praca `internal`). Wizytówka linkuje do dowodów, nie odwrotnie.
Rekomendacja senior: **B** jest czystsza dla wizytówki i eliminuje ryzyko wycieku `internal`
przez przypadkową publikację. To warunek wstępny dla całej reszty.

## Decyzja architektoniczna: kod w vaultcie (monorepo) vs osobne repo

Pytanie operatora: *czy IaC pod laba ma być w tym vaultcie, czy w osobnym repo?* Poniżej
uczciwe „za i przeciw" dla obu wariantów, potem rekomendacja.

### Wariant 1 — monorepo (wszystko w vaultcie: docs + IaC + kod + CI/CD)
**Za:**
- Jedno źródło prawdy: notatka teorii, lab i **dowód** (`05-evidence/`) leżą obok kodu, który
  je potwierdza — mocne dla portfolio (recenzent widzi opis i implementację w jednym miejscu).
- Jeden clone, jedna historia, jeden config CI — mniej narzutu dla solowego uczącego się.
- Graf Obsidiana i `[[wiki-links]]` spinają notatki z kodem; pipeline Theory→Lab→Evidence
  zostaje spójny w jednym commicie/PR.
- Brak problemu dryfu „docs w jednym repo opisują kod w innym".

**Przeciw:**
- Vault Obsidiana ≠ repo software'owe. `.obsidian/`, markdown, `terraform state`/CI w jednym
  drzewie to szum. Kolizja narzędzi: `terraform fmt`/`tflint`/`checkov`, lintery Go/Python,
  pre-commit, dependabot vs. repo dokumentacyjne. CODEOWNERS i branch protection mają inną
  semantykę dla docs i dla kodu.
- CI musi być **path-filtered** (odpalaj `terraform plan` tylko przy zmianie `**.tf`), inaczej
  pełny pipeline chodzi przy commitach czysto-dokumentacyjnych. Wykonalne, ale więcej configu.
- Recenzent/rekruter klonujący „wizytówkę" dostaje wielkie mieszane drzewo; kod **nie czyta się
  jak samodzielny, uruchamialny projekt** — a to jest waluta, którą oceniają rekruterzy.
- Wyższe ryzyko wycieku: `*.tfstate`, `*.tfvars`, artefakty — łatwiej przypadkiem wpuścić do
  publicznego repo, gdy `.gitignore` jest „dokumentacyjny", nie „terraformowy".
- Blast radius: rewrite historii, żeby usunąć wyciekły sekret z kodu, przepisuje też historię docs.
- Stan Terraforma i duże artefakty **i tak nie należą** do vaulta wiedzy.

### Wariant 2 — osobne repo (jedno lub kilka) na kod/IaC; vault = docs + index
**Za:**
- Każdy lab/projekt to **samodzielny, uruchamialny artefakt**: własny README, własny CI
  (fmt/validate/tflint/checkov/plan), badge, release. Dokładnie to, co recenzent chce zobaczyć:
  „oto repo, które klonuję i robię `terraform plan`".
- Izolacja narzędzi: Terraform/Ansible/Go/Python dostają właściwe linterowanie, `.gitignore`,
  pre-commit i dependabot bez zaśmiecania vaulta.
- Właściwy model wrażliwości per typ repo (repo kodu ma inne ryzyka niż repo notatek).
- Vault zostaje czystym indeksem wiedzy/portfolio, który **linkuje** do repo kodu; dowód
  (`05-evidence/`) wskazuje URL repo **+ przypięty commit SHA** (niezmienny wskaźnik) — bardzo
  mocny wzorzec evidence.

**Przeciw:**
- Dryf: docs w vaultcie opisujące kod w innym repo się starzeją. Wymaga dyscypliny (linkuj po
  SHA, nie tylko po nazwie repo).
- Więcej narzutu dla solisty: N repo, N configów CI, N zestawów branch protection, context-switch.
- Słabsza narracja „jedno miejsce pokazuje wszystko" — recenzent musi klikać linki. Łagodzi to
  dobra strona-indeks (portfolio) w vaultcie.
- Pipeline nauki traci ciasne sprzężenie: kod laba nie jest w tym samym PR co teoria i dowód.

### Rekomendacja senior
**Dziel po naturze artefaktu, nie dogmatycznie:**
1. **Vault** = wiedza + indeks portfolio + **krótkie, ilustracyjne snippety** wklejone w notatki
   (nie mają się uruchamiać samodzielnie). Zostaje czystym repo Obsidiana. **Nie** wrzucaj tu
   `terraform state`, realnych modułów IaC ani kodu odpalanego przez CI.
2. **Kod, który ma być uruchamiany i pokazywany** → **osobne repo per spójny projekt**
   (np. `homelab-k8s`, `aws-security-baseline`), każde z własnym CI. Nie repo-per-moduł —
   grupuj po projekcie, żeby solista nie utonął w kilkunastu repo.
3. Notatki `05-evidence/` linkują do repo **+ przypięty SHA**. CI vaulta zostaje minimalne
   (markdownlint, link-check, walidacja frontmattera); ciężki CI (plan/lint/security) żyje w repo kodu.

**Dlaczego tak:** portfolia ocenia się po *uruchamialnych, dobrze zainżynierowanych repo*, a vault
wiedzy po *przejrzystości i strukturze*. Wciśnięcie obu w jedno drzewo pogarsza każde z nich.
Jeśli operator mimo to chce jedno miejsce — dopuszczalny monorepo z twardym rozdziałem
`/docs` (vault) i `/labs/<projekt>/` (IaC), path-filtered CI oraz osobnym `.gitignore`/pre-commit
po stronie kodu. Ale dla **publicznej wizytówki** wariant „osobne repo" wygrywa, bo standalone
repo to język, który rekruterzy czytają wprost.

## Kontrakt review: AI jako senior reviewer

Gdy operator pokazuje kod, AI recenzuje jak doświadczony senior: **konkretnie, z uzasadnieniem,
bez owijania** — ale konstruktywnie (co i *dlaczego* poprawić, oraz jak). Nie chwali na wyrost;
nie zmyśla problemów. Osobno **feedback** (co poprawić) i osobno **ocena poziomu** (seniority).

### Wymiary oceny (rubryka)
1. **Poprawność / czy działa** — `validate`/`plan` czyste, brak błędów, robi to co deklaruje.
2. **Struktura i modularność** — granice modułów, DRY (Terragrunt zamiast copy-paste środowisk).
3. **Higiena stanu i sekretów** — remote state z lockiem; **żadnego** `state`/`tfvars`/sekretów
   w repo; brak plaintext credów.
4. **Bezpieczeństwo** — least-privilege IAM, `checkov`/`tfsec`, szyfrowanie, brak przypadkowej
   ekspozycji publicznej.
5. **Idempotencja i powtarzalność** — Ansible idempotentny; przypięte wersje providerów/modułów.
6. **Czytelność** — nazewnictwo, spójny styl, komentarze o gęstości jak w otoczeniu, nie „co robi
   kod" tylko „dlaczego".
7. **Testy** — `terraform validate`+`tflint`, `molecule` (Ansible), testy Go/Python; opcjonalnie terratest.
8. **CI/CD** — fmt→validate→lint→security-scan→plan na PR; **OIDC do chmury zamiast długoterminowych kluczy**.
9. **Dokumentacja** — README: wymagania, jak uruchomić, **jak posprzątać (teardown)**, koszt.

### Skala poziomu (jak nazwać seniority)
- **Junior** — działa, ale copy-paste, hardcode, brak CI, ryzyko sekretów.
- **Mid** — moduły, remote state, podstawowy CI, trochę lintowania.
- **Senior** — DRY (Terragrunt), least-priv IAM, security-scan w CI, OIDC, przypięte wersje, testy,
  README z teardownem, świadomość kosztu, ADR na kompromisy.
- **Staff/Principal** — wzorce wielokrotnego użytku, policy-as-code (OPA/Sentinel), promocja
  multi-env, drift detection, DR, świadomie udokumentowane trade-offy.

Feedback zawsze wskazuje **następny poziom**: co konkretnie dowieźć, żeby wejść wyżej.

## Pytania do ChatGPT

1. Rozstrzygnij (z argumentami) napięcie „repo publiczne vs `classification: internal`":
   wariant A (tylko treść public-safe) czy B (split public showcase + private working vault)?
   Jaki konkretny układ repo/branchy proponujesz dla wizytówki?
2. Dla kodu (Terraform, Terragrunt, Ansible, Python, Go, CI/CD) — potwierdź lub zakwestionuj
   rekomendację „osobne repo per projekt + evidence linkuje po SHA". Kiedy monorepo byłoby
   jednak lepsze i jak wtedy poukładać path-filtered CI?
3. Zaproponuj minimalny, ale „senior-grade" baseline CI/CD dla repo IaC (kolejność kroków,
   security-scan, OIDC zamiast kluczy) — tak, by dało się go pokazać rekruterowi jako wzorzec.
4. Jakie dowody (`05-evidence/`) uczynią repo kodu wiarygodnym dla rekrutera/audytora
   (README, teardown, koszt, testy, badge) i jak spiąć je z notatkami vaulta bez dryfu?
5. Wskaż słabe punkty i ryzyka tego modelu pracy z AI (bramka `llm_exposure`, izolacja domen,
   publiczne repo) oraz co usprawnić bez osłabiania bezpieczeństwa danych.

## Po powrocie wyniku

Wynik z ChatGPT wraca jako notatka vaulta zgodna z [[AGENTS]] (po polsku, kebab-case,
pełny frontmatter), np. do `30-standards/` lub `50-patterns/`. Surowy wynik nie jest
źródłem prawdy.

## Raport skilla (wypisany operatorowi)

```
Temat: vault platform-engineering-academy — zastosowania, możliwości + strategia kodu/repo (update 2026-07-15)
Domena: shared-concept
Źródła włączone (ciała notatek): 0
  - brak notatek allowed/allowed_anonymized na tym etapie (treść vaulta jest szablonowa)
Wejścia niewrażliwe użyte: wymóg operatora (kod+repo, 2026-07-15); fakt strukturalny — brak kodu/IaC w repo
Fakty strukturalne użyte (niewrażliwe): vault-manifest.yaml, lista katalogów, nazwy kontraktów i skilli
Źródła pominięte: 7
  - README.md — brak frontmattera → forbidden (treść niecytowana)
  - _system/* — brak frontmattera → forbidden (treść niecytowana)
  - start-here / now / roadmap / theory — allowed_internal_only (narzędzie zewnętrzne)
Dodano sekcje: nowy zakres (kod w portfolio), napięcie public-vs-internal, decyzja monorepo vs osobne repo,
  kontrakt review (rubryka + skala seniority)
Metoda: oryginalna synteza shared-concept + analiza senior reviewera, bez cytowania ciał notatek gated.
```
