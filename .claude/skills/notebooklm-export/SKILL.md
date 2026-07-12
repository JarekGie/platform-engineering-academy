---
name: notebooklm-export
description: >
  Aktywuj gdy operator chce przygotować źródła do NotebookLM: triggery
  "przygotuj źródła do NotebookLM", "zbierz źródła NotebookLM", "odśwież sources.md".
  Zbiera WYŁĄCZNIE notatki z `notebooklm_source: approved` i zapisuje rejestr
  w `90-reference/notebooklm/sources.md`.
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: notebooklm-export
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Zebrać zatwierdzone źródła NotebookLM i zapisać/odświeżyć rejestr w
`90-reference/notebooklm/sources.md` (patrz [[NOTEBOOKLM_CONTRACT]]).

## Zakres
Źródłem jest TYLKO notatka z `notebooklm_source: approved`. `candidate` czeka na zatwierdzenie,
`rejected` i `false` — nigdy. Dodatkowo źródło musi mieć dopuszczalne `llm_exposure`
(patrz [[LLM_CONTEXT_BOUNDARY_CONTRACT]]). NotebookLM NIE jest source of truth.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i `02-active-context/now.md` — kontrakt notatki
   i aktywną domenę. To pierwsza czynność.
2. Przeszukaj vault po frontmatterze `notebooklm_source`. Wciągnij WYŁĄCZNIE notatki
   z wartością `approved`. Pomiń `candidate`, `rejected`, `false`.
3. Dla każdego kandydata zweryfikuj dodatkowe bramki:
   - `llm_exposure: forbidden` → odrzuć mimo `approved`;
   - `classification: restricted` → odrzuć;
   - `classification: confidential` bez `compliance_review: approved` → odrzuć;
   - brak `approved_by` lub `approved_date` → nie jest realnie zatwierdzone, zgłoś i pomiń.
4. Sprawdź, że wszystkie źródła należą do JEDNEJ domeny (patrz [[DOMAIN_ISOLATION_CONTRACT]]).
5. Zbuduj/odśwież `90-reference/notebooklm/sources.md`. Każdy wpis wg szablonu
   `templates/sources-entry.md` (pola schematu `schemas/notebooklm-source.schema.yaml`):
   `source_id`, `title`, `origin_note` ([[wiki-link]]), `notebooklm_source`, `approved_by`,
   `approved_date`, `classification`, `llm_exposure`, `notes`. Ustaw `updated:` na dziś.
6. Usuń z rejestru wpisy, których notatka straciła status `approved` (odśwież, nie duplikuj).
7. Wypisz raport: liczba źródeł `approved` w rejestrze, liczba pominiętych kandydatów
   i powód pominięcia każdego.

## Czego skill NIE robi
- nie wciąga `candidate`/`rejected`/`false` jako źródeł;
- nie eksportuje `restricted` ani `confidential` (bez approve);
- nie zmienia `notebooklm_source` notatek (to robi compliance/owner);
- nie traktuje wyników NotebookLM jako źródła prawdy — synteza wraca jako notatka vaulta.
