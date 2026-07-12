---
name: switch-project
description: >
  Aktywuj gdy operator chce zmienić bieżący projekt: triggery "przełącz na <projekt>",
  "przełączamy na <projekt>", "switch to <projekt>". Domyka bieżącą domenę, wczytuje
  manifest projektu i aktualizuje aktywny kontekst oraz domenę w now.md.
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: switch-project
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Jawnie przełączyć aktywny projekt i domenę w `02-active-context/now.md`, bez mieszania
domen w jednym kontekście (patrz [[DOMAIN_ISOLATION_CONTRACT]]).

## Zakres
Jedna sesja = jedna domena. Jeśli nowy projekt ma INNĄ domenę niż bieżąca, skill
ostrzega, że to oznacza nowy kontekst — operator zamyka poprzedni.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i bieżący `02-active-context/now.md`.
2. Znajdź projekt w `20-projects/` po nazwie podanej przez operatora
   (dopasowanie po nazwie pliku w kebab-case lub po `title:`).
3. Jeśli projektu brak — zaproponuj utworzenie notatki projektu z szablonu
   `templates/project-manifest.md`; nie wymyślaj danych.
4. Wczytaj manifest/notatkę projektu: cel, zakres, domena, powiązane runbooki, status.
   Uszanuj `llm_exposure` — `forbidden` nie wchodzi do kontekstu.
5. Porównaj domenę projektu z aktywną domeną w `now.md`:
   - ta sama domena → kontynuuj w tej samej sesji;
   - inna domena → ostrzeż operatora; zapisz stan bieżącej domeny (log w [[end-day]]
     lub krótka notka) i dopiero potem przełącz domenę.
6. Pokaż operatorowi bieżący kontekst projektu: cel, status, następny krok, otwarte wątki.
7. Zaktualizuj `02-active-context/now.md`: aktywny projekt (link [[20-projects/...]]),
   aktywna domena, bieżący kontekst, następny krok. Ustaw `updated:` na dziś.

## Czego skill NIE robi
- nie trzyma dwóch domen naraz w `now.md`;
- nie przełącza domeny po cichu — zawsze sygnalizuje zmianę kontekstu;
- nie modyfikuje manifestu projektu bez zgody operatora.
