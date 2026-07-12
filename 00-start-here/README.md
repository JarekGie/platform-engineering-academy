# 00-start-here

Vault **budowy kompetencji przez naukę praktyczną** (Academy). Tu jest punkt wejścia.
Plik `start-here.md` dopisuje generator (`bin/new-vault.sh`) — nie twórz go ręcznie.

## Do czego służy ten vault
Budowa ścieżek edukacyjnych (Platform Engineering / AWS / Kubernetes / Security / AI Academy)
prowadzonych jako system: roadmap → teoria → lab → assessment → homelab → evidence → real project.
Typ **public-friendly** i **open-source-friendly** — domyślna klasyfikacja `internal`, domena `learning`.

## Główny pipeline
`Roadmap → Theory → Lab → Assessment → Homelab → Evidence → Real Project`
- `01-roadmap/` — ścieżka i kolejność modułów,
- `02-modules/<temat>/` — teoria, resources, laby, assessment, evidence modułu,
- `03-labs/` — laby praktyczne (objective→validation→troubleshooting→evidence),
- `04-assessments/` — sprawdzenie wiedzy i praktyki,
- `07-homelab/` — środowisko treningowe (architektura, provisioning, eksperymenty),
- `05-evidence/` — dowody kompetencji (PRODUCENT dla Career OS),
- `08-real-projects/` — końcowe dowody: rzeczywiste wdrożenia i case studies.

## Granice (czym Academy NIE jest)
Academy = **produkcja kompetencji**. Nie duplikuj danych sąsiadów — wskazuj je przez `source_ref`:
- **learning** — konsumpcja wiedzy (materiał kursowy, synteza). Tu `01-roadmap` to plan budowy
  kompetencji, nie magazyn materiału.
- **career** — ocena i zarządzanie kompetencjami (skill matrix, readiness). Academy PRODUKUJE evidence,
  które Career OS konsumuje (federacja przez `evidence_id` + `source_system: academy` + `source_ref`).
- **resume-generator** — prezentacja doświadczenia (CV/ATS/aplikacje).
- **personal-brand** — publikacja kompetencji (LinkedIn, artykuły, case studies).

Co tu trafia:
- drogowskazy do [[now]], [[roadmap]], [[open-loops]] i katalogów pipeline,
- krótkie wyjaśnienie domyślnej domeny (`learning`).
