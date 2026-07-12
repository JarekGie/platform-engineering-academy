---
name: context-pack
description: >
  Aktywuj gdy operator chce zbudować kontekst dla ChatGPT: triggery
  "przygotuj kontekst dla ChatGPT", "zbuduj context-pack", "paczka dla ChatGPT".
  Generuje/odświeża paczkę w `_chatgpt/context-packs/<temat>.md`, bramkując
  treść przez `llm_exposure` i anonimizując dane wrażliwe.
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: context-pack
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Zbudować paczkę kontekstu dla ChatGPT w `_chatgpt/context-packs/<temat>.md`, zawierającą
WYŁĄCZNIE treść dopuszczoną do narzędzia zewnętrznego (patrz [[CHATGPT]]).

## Zakres
Jedna paczka = jedna domena (patrz [[DOMAIN_ISOLATION_CONTRACT]]). Do paczki wchodzi tylko
materiał `llm_exposure: allowed` lub `allowed_anonymized` (po anonimizacji).
Nigdy `restricted`, `confidential`, `forbidden` ani `allowed_internal_only`.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i `02-active-context/now.md` — kontrakt notatki
   i aktywną domenę. To pierwsza czynność.
2. Ustal temat paczki i nazwę pliku w kebab-case: `_chatgpt/context-packs/<temat>.md`.
3. Zbierz notatki kandydujące do tematu, ale dla KAŻDEJ sprawdź frontmatter wg
   [[LLM_CONTEXT_BOUNDARY_CONTRACT]]:
   - `allowed` → wchodzi bez zmian;
   - `allowed_anonymized` → wchodzi DOPIERO po anonimizacji (krok 4);
   - `allowed_internal_only`, `forbidden` → pomiń, nie cytuj;
   - `classification: confidential` bez `compliance_review: approved` → pomiń;
   - `classification: restricted` → nigdy.
   Jeśli pole brakuje lub jest niejasne — traktuj jak `forbidden`.
4. Anonimizuj `allowed_anonymized`: usuń nazwy klientów, osób, projektów NDA, hosty, adresy,
   sekrety; zastąp stałymi placeholderami (`KLIENT_A`, `ENV_X`). Jeśli po anonimizacji treść
   traci sens — nie eksportuj.
5. Sprawdź, że wszystkie wybrane źródła należą do TEJ SAMEJ domeny. Mieszanie domen — stop.
6. Wygeneruj/odśwież plik z szablonu `templates/context-pack.md`: cel paczki, domena,
   sekcja "Materiały źródłowe (sprawdzone llm_exposure)" z [[wiki-linkami]] i statusem
   ekspozycji każdego źródła, treść/streszczenie, pytania do ChatGPT. Ustaw `updated:` na dziś.
7. Wypisz operatorowi raport: temat, domena, liczba źródeł włączonych vs pominiętych
   i powód pominięcia każdego.

## Czego skill NIE robi
- nie wkleja notatek z `forbidden`, `restricted`, `confidential` (bez approve) ani `allowed_internal_only`;
- nie miesza domen w jednej paczce;
- nie commituje ani nie pushuje (to robi [[end-day]]);
- nie traktuje wyniku z ChatGPT jako źródła prawdy — to zostaje w vaultcie.
