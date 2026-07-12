---
name: end-day
description: >
  Aktywuj gdy operator zamyka sesję pracy: triggery "kończymy", "fajrant",
  "koniec", "koniec dnia". Dopisuje log sesji, robi conventional commit, pushuje
  branch dnia i wypisuje instrukcję utworzenia MR (glab mr create).
allowed-tools:
  - Bash(git:*)
  - Bash(glab:*)
  - Read
  - Edit
  - Write
skill_name: end-day
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Domknąć sesję: zapisać log, zacommitować i wypchnąć pracę z dnia, podać instrukcję MR.

## Zakres
Commit i push tylko na wyraźne polecenie operatora (patrz [[CLAUDE]]).
Jedna sesja = jeden branch `<operator>/<YYYY-MM-DD>`.

## Kroki
1. Przeczytaj `02-active-context/now.md` — ustal operatora, aktywną domenę i branch sesji.
2. Dopisz wpis do logu sesji w `90-reference/session-log.md` (utwórz z szablonu
   `templates/session-log-entry.md`, jeśli pliku brak). Wpis: data, operator, domena,
   zrobione, otwarte, dotknięte notatki. Zaktualizuj `updated:` w dotkniętych notatkach.
3. `git status` — pokaż operatorowi listę zmian.
4. Dodaj WYŁĄCZNIE pliki tej sesji (jawnie wymienione ścieżki), nie `git add -A`:
   `git add 02-active-context/now.md 90-reference/session-log.md <inne dotknięte>`.
5. Zbuduj conventional commit z szablonu `templates/commit-message.md`
   (np. `feat(aiops): analiza degradacji p95 z load testu UAT`). Pokaż treść operatorowi.
6. Po akceptacji: `git commit -m "<typ(zakres): opis>"`.
7. Wypchnij branch: `git push -u origin <operator>/<YYYY-MM-DD>`.
8. Wypisz instrukcję utworzenia MR z szablonu `templates/mr-description.md`:
   ```
   glab mr create --source-branch <operator>/<YYYY-MM-DD> --target-branch main \
     --title "<tytuł>" --description "<opis>"
   ```
   Tytuł i opis (Podsumowanie / Zmiany / Domena / Ryzyko) gotowe do wklejenia.

## Czego skill NIE robi
- nie używa `git add -A` ani `git add .` (tylko jawne ścieżki);
- nie commituje notatek `restricted`/`confidential` poza vault (zostają w vaultcie);
- nie tworzy MR automatycznie — wypisuje gotową komendę dla operatora.
