---
name: incident-note
description: >
  Aktywuj gdy operator zgłasza zdarzenie operacyjne: triggery "incydent",
  "awaria", "RCA", "post-mortem". Tworzy notatkę incydentu w
  `40-runbooks/incidents/` zgodną z kontraktem notatki, z pełnym frontmatterem
  i polami RCA (timeline, root cause, follow-up).
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: incident-note
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Utworzyć notatkę incydentu w `40-runbooks/incidents/` wg wzorca runbooka, z pełnym
frontmatterem i sekcją RCA (patrz [[AGENTS]]).

## Zakres
Jeden incydent = jedna notatka, jedna domena (`aiops` lub `internal-ops`).
`classification` zależy od wpływu i danych w opisie. Bez wymyślania liczb i przyczyn —
brak danych oznacz wprost jako brak.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i `02-active-context/now.md` — kontrakt notatki
   i aktywną domenę. To pierwsza czynność.
2. Ustal nazwę pliku w kebab-case: `40-runbooks/incidents/<YYYY-MM-DD>-<krotki-temat>.md`.
3. Ustaw `domain`: `aiops` (infrastruktura/monitoring/wydajność) albo `internal-ops`
   (procesy wewnętrzne). Nie mieszaj domen.
4. Dobierz `classification` do wpływu i treści: `internal` domyślnie; `confidential`
   gdy wchodzą dane klienta/osobowe (wtedy `compliance_review: required`, `llm_exposure`
   nie wyżej niż `allowed_internal_only`). Nigdy nie zaniżaj klasyfikacji.
5. Wypełnij notatkę z szablonu `templates/incident-note.md`:
   - `## Objaw / problem` — co się stało, kiedy, jaki wpływ;
   - `## Kontekst` — środowisko, powiązane runbooki [[40-runbooks/...]], projekt [[20-projects/...]];
   - `## Działania / rozwiązanie` — kroki naprawcze i mitygacja;
   - `## Uwagi` — pola RCA: **Timeline** (zdarzenia z godzinami), **Root cause**
     (przyczyna źródłowa), **Follow-up actions** (lista z właścicielem i terminem).
6. Uzupełnij frontmatter: `created`/`updated` = dziś, sensowne `tags` (np. `[incident, rca]`).
7. Powiąż incydent z istniejącym runbookiem lub zaproponuj nowy, jeśli brak.
8. Wypisz raport: ścieżka notatki, domena, klasyfikacja, status RCA (wstępny / domknięty).

## Czego skill NIE robi
- nie miesza `aiops` i `internal-ops` w jednej notatce;
- nie wymyśla przyczyny ani timeline'u — brak danych oznacza jako otwarty wątek;
- nie zaniża `classification` ani nie pomija `compliance_review` przy danych wrażliwych;
- nie commituje ani nie pushuje (to robi [[end-day]]).
