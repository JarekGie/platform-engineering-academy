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
   (Dla remote GitHub użyj `gh pr create --base main --head <operator>/<YYYY-MM-DD> ...`.)
   Tytuł i opis (Podsumowanie / Zmiany / Domena / Ryzyko) gotowe do wklejenia.
9. **Pre-generacja podcastu na następny dzień (tylko `vault_type: academy`).** Po commit/push:
   - odczytaj `00-start-here/academy-state.md` → `next_action` / `active_module` i [[adaptive-roadmap]],
     żeby ustalić NASTĘPNY temat nauki (np. kolejny odcinek modułu);
   - deleguj do [[academy-podcasts]]: zbuduj materiały (source-pack, brief, glossary, questions)
     i uruchom generację **audio w tle** (background agent), aby było gotowe na następny `start-day`;
   - respektuj security hard gate academy-podcasts (tylko źródła publiczne/dopuszczone, nigdy
     `allowed_internal_only`/`forbidden`/`restricted`);
   - quiz i flashcards NIE tutaj — powstają w [[academy-learning-loop]] po odsłuchu;
   - materiały pre-generowane pozostają niezacommitowane; zacommituje je end-day następnej sesji.
   Cel: audio (10–20 min generacji) startuje na koniec dnia i jest gotowe rano — szybszy start nauki.

## Czego skill NIE robi
- nie używa `git add -A` ani `git add .` (tylko jawne ścieżki);
- nie commituje notatek `restricted`/`confidential` poza vault (zostają w vaultcie);
- nie tworzy MR automatycznie — wypisuje gotową komendę dla operatora;
- nie pre-generuje podcastu poza vaultami `academy` ani gdy brak jednoznacznego następnego tematu
  (wtedy pomija krok 9 i zgłasza to operatorowi).
