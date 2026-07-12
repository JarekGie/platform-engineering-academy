# 02-modules

Krok 2 pipeline: **teoria i struktura modułu**. Jeden podkatalog = jeden temat/moduł. Każdy moduł
wspiera pięć plików:

- `theory.md` — koncepty, mental models,
- `resources.md` — kursy, dokumentacja, źródła,
- `labs.md` — indeks labów modułu (szczegóły w [[03-labs]]),
- `assessment.md` — sprawdzenie (szczegóły/wyniki w [[04-assessments]]),
- `evidence.md` — wymagania dowodowe modułu (dowody w [[05-evidence]]).

Przykładowy moduł: `kubernetes/`. Nowe moduły skrobaj z szablonów `templates/`
(`module-theory`, `module-resources`, `lab`, `assessment`, `evidence-register`).

## Moduł płaski vs pillar-group

`02-modules/` może zawierać dwie formy:

- **moduł płaski** — katalog tematu bezpośrednio pod `02-modules/` (np. `kubernetes/`);
- **pillar-group (filar)** — katalog filaru z submodułami (np. `security-platform/<submoduł>/`),
  gdy obszar jest na tyle duży, że stanowi równorzędny filar kompetencyjny. Każdy submoduł
  zachowuje ten sam kontrakt 5 plików.

Obecny stan jest świadomie asymetryczny: `kubernetes/` jest płaski, `security-platform/` jest
pillar-group. Ewentualne regrupowanie modułów Platform Engineering do `platform-engineering/`
to osobna decyzja architektoniczna (poza bieżącym zakresem). Indeks filaru Security:
[[security-platform/README|security-platform]].

Pipeline: Roadmap → **Theory** → Lab → Assessment → Homelab → Evidence → Real Project.
