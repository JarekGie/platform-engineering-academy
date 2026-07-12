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
updated: 2026-07-12
tags: [chatgpt, context-pack, shared-concept, vault, framework]
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

## Pytania do ChatGPT

1. Na podstawie powyższego opisu — zaproponuj konkretny, tygodniowy rytm pracy z tym
   vaultem (co robić w start-day / w trakcie / w end-day), tak aby pipeline nauki
   Roadmap→…→Evidence realnie się domykał.
2. Jakie typy notatek/treści warto dodać do modułu, żeby dowód kompetencji (`evidence_id`)
   był mocny i weryfikowalny przez rekrutera lub audytora?
3. Wskaż słabe punkty i ryzyka tego modelu pracy z AI (bramka `llm_exposure`, izolacja
   domen) oraz co można usprawnić bez osłabiania bezpieczeństwa danych.
4. Zaproponuj, jak wykorzystać ten vault do budowy marki eksperckiej (treści LinkedIn,
   artykuły) — wyłącznie z materiału `shared-concept`, bez ujawniania danych `internal`.

## Po powrocie wyniku

Wynik z ChatGPT wraca jako notatka vaulta zgodna z [[AGENTS]] (po polsku, kebab-case,
pełny frontmatter), np. do `30-standards/` lub `50-patterns/`. Surowy wynik nie jest
źródłem prawdy.

## Raport skilla (wypisany operatorowi)

```
Temat: vault platform-engineering-academy — zastosowania i możliwości
Domena: shared-concept
Źródła włączone (ciała notatek): 0
  - brak notatek allowed/allowed_anonymized na tym etapie (treść vaulta jest szablonowa)
Fakty strukturalne użyte (niewrażliwe): vault-manifest.yaml, lista katalogów, nazwy kontraktów i skilli
Źródła pominięte: 7
  - README.md — brak frontmattera → forbidden (treść niecytowana)
  - _system/* — brak frontmattera → forbidden (treść niecytowana)
  - start-here / now / roadmap / theory — allowed_internal_only (narzędzie zewnętrzne)
Metoda: oryginalna synteza frameworku jako konceptu shared-concept, bez cytowania ciał notatek gated.
```
