---
name: start-day
description: >
  Aktywuj gdy operator otwiera sesję pracy w vaultcie: triggery "zaczynamy",
  "lecimy", "start day", "zaczynamy dzień". Synchronizuje main, zakłada branch
  dnia i ustawia jedną aktywną domenę w now.md.
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: start-day
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Otworzyć sesję pracy: zsynchronizować repo, założyć branch dnia i zadeklarować
JEDNĄ aktywną domenę w `02-active-context/now.md`.

## Zakres
Jedna sesja = jedna domena wrażliwości (patrz [[DOMAIN_ISOLATION_CONTRACT]]).
Skill nie miesza domen i nie czyta notatek z `llm_exposure: forbidden`.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i `_system/CLAUDE.md` ([[CLAUDE]]) —
   kontrakt notatki, frontmatter, granice domen. To pierwsza czynność sesji.
2. Sprawdź stan repo: `git status`. Jeśli są niezacommitowane zmiany, zatrzymaj się
   i poproś operatora o decyzję (dokończenie poprzedniej sesji `end-day`).
3. Zsynchronizuj main bez merge'y: `git checkout main && git pull --ff-only`.
4. Ustal operatora i datę. Operator = login z `git config user.email` (część przed `@`)
   lub jawnie podany. Data = `YYYY-MM-DD` (dziś).
5. Załóż branch dnia: `git checkout -b <operator>/<YYYY-MM-DD>`
   (np. `jgolab/2026-06-10`). Jeśli branch istnieje — `git checkout <operator>/<YYYY-MM-DD>`.
6. Zapytaj operatora o aktywną domenę, jeśli nie wynika z kontekstu. Dozwolone wartości:
   `client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd`.
7. Zaktualizuj `02-active-context/now.md` z szablonu `templates/now-snapshot.md`:
   aktywny operator, aktywna domena, bieżący kontekst (projekt z [[20-projects]]),
   następny krok. Ustaw `updated:` na dziś. NIE zmieniaj innych domen.
8. Przejrzyj `01-inbox/` i wymień operatorowi pozycje do rozpracowania w tej domenie.
9. Wypisz podsumowanie startu: branch, operator, aktywna domena, następny krok.

## Czego skill NIE robi
- nie commituje ani nie pushuje (to robi [[end-day]]);
- nie ustawia więcej niż jednej domeny w `now.md`;
- nie modyfikuje `_system/` bez zgody operatora.
