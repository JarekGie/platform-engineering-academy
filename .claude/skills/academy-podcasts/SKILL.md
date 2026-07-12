---
name: academy-podcasts
description: >
  NotebookLM Learning Engine dla Academy. Aktywuj gdy uczący się chce wyprodukować materiały
  podcastowe do nauki: triggery "podcast", "podcasty", "następny podcast". Buduje source-pack →
  brief → glossary → questions → feedback dla serii How-To i podcastów per filar. Egzekwuje
  kontrakty bezpieczeństwa PRZED każdym eksportem do NotebookLM. Wymaga notebooklm włączonego
  w manifeście vaulta.
allowed-tools:
  - Read
  - Edit
  - Write
skill_name: academy-podcasts
mandatory: false
enforcement: soft
allow_workaround: true
on_failure: warn
---

## Cel
Automatyzować produkcję materiałów podcastowych jako pomocy w nauce — nie source of truth.
Podcast jest artefaktem pochodnym z zatwierdzonych źródeł vaulta.

## Warunek wstępny
Vault musi mieć `notebooklm: true` w `vault-manifest.yaml` (a dla eksportu audio `podcast: true`).
Jeśli wyłączone — powiedz to wprost i podaj, jak wygenerować/zmigrować vault z NotebookLM.

## Scaffolding w runtime (NIE w szablonie)
Poddrzewo `90-reference/notebooklm/` jest własnością generatora (inwariant frameworka), dlatego
katalogi podcastowe tworzy TEN skill przy pierwszym uruchomieniu:
```
90-reference/notebooklm/
├── academy-how-to/         # seria startowa (Podcast 1–4)
├── generated-podcasts/     # podcasty per filar
└── feedback/               # feedback → roadmap update
```
Twórz je tylko gdy `notebooklm: true`. Nie nadpisuj plików tworzonych przez generator
(`README.md`, `sources.md`, `notebook-contract.md`, `podcast-policy.md`, `prompts/`, `findings/`,
`artifacts/`, `conversations/`).

## Komendy

| Komenda | Efekt |
| --- | --- |
| `podcast` / `podcasty` | Przygotuj materiały podcastowe (wybór: seria How-To lub filar) |
| `następny podcast` | Kolejny odcinek wg kolejności serii / roadmapy |

## Seria startowa — Academy How-To
Do `academy-how-to/`:
1. Czym jest Academy · 2. Jak zacząć · 3. Theory → Evidence · 4. Tygodniowy workflow.

## Podcasty per filar
Do `generated-podcasts/`: Platform Engineering, Linux, Networking, Containers, Kubernetes, GitOps,
Observability, SRE, Infrastructure as Code, Cloud Platform, Security Platform Engineering, FinOps,
AI Platform Engineering, AI Security, AI SecOps, Go, Distributed Systems, Platform APIs.

## Dla każdego podcastu (artefakty)
Szablony w `.claude/skills/academy-podcasts/templates/`:
- `source-pack.md` — zatwierdzone źródła (wskaźniki, nie treść),
- `podcast-brief.md` — brief dla hostów,
- `glossary.md` — słownik pojęć,
- `questions-for-hosts.md` — pytania prowadzące,
- `feedback-and-followups.md` — feedback po odsłuchu → aktualizacja roadmapy.

## Podcast Workflow
`Academy → Approved Sources → NotebookLM → Podcast → Feedback → Roadmap Update`.
Feedback wraca do [[academy-coach]] (aktualizacja `adaptive-roadmap.md`).

## Security Rules (HARD GATE — przed KAŻDYM eksportem)
Sprawdź, w tej kolejności, ZANIM cokolwiek trafi do NotebookLM:
1. [[NOTEBOOKLM_CONTRACT]] — źródło ma status `approved`;
2. [[PODCAST_EXPORT_POLICY]] — `podcast_export: allowed` lub `allowed_after_review` (to drugie = gate compliance);
3. [[LLM_CONTEXT_BOUNDARY_CONTRACT]] — dozwolone `llm_exposure`;
4. [[DOMAIN_ISOLATION_CONTRACT]] — jedna domena wrażliwości na sesję.

**NIGDY nie eksportuj:** `restricted`, `forbidden`, `allowed_internal_only`, danych klientów,
sekretów, konfiguracji produkcyjnych, CrowdStrike CID, adresów IP, nazw hostów, identyfikatorów kont.

W razie wątpliwości — NIE eksportuj i zgłoś operatorowi. Naruszenie tej reguły to naruszenie
kontraktu bezpieczeństwa vaulta.

## Powiązane
[[academy-coach]], [[academy-learning-loop]], [[NOTEBOOKLM_CONTRACT]], [[PODCAST_EXPORT_POLICY]].
