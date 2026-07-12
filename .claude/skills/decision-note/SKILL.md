---
name: decision-note
description: >
  Aktywuj gdy operator zapisuje decyzję architektoniczną: triggery "decyzja",
  "ADR", "zapisz decyzję", "decision record". Dopisuje wpis ADR do
  `80-architecture/decision-log.md` jako `### ADR-NNNN — <tytuł>` ze stałą strukturą
  Status / Kontekst / Decyzja / Konsekwencje.
allowed-tools:
  - Bash(git:*)
  - Read
  - Edit
  - Write
skill_name: decision-note
mandatory: true
enforcement: hard
allow_workaround: false
on_failure: stop_and_report_contract_violation
---

## Cel
Dopisać rekord decyzji architektonicznej (ADR) do `80-architecture/decision-log.md`
w spójnym formacie `### ADR-NNNN — <tytuł>` (patrz [[AGENTS]]).

## Zakres
Jeden ADR = jeden wpis dopisany na końcu logu, nigdy nadpisanie istniejącego.
Numeracja ciągła, monotoniczna. Treść po polsku, konkretna, bez wymyślania ustaleń.

## Kroki
1. Przeczytaj `_system/AGENTS.md` ([[AGENTS]]) i `02-active-context/now.md` — kontrakt notatki
   i aktywną domenę. To pierwsza czynność.
2. Otwórz `80-architecture/decision-log.md`. Jeśli pliku brak — utwórz go z pełnym
   frontmatterem (wzór jak w `templates/decision-log-entry.md`) i nagłówkiem logu.
3. Ustal kolejny numer: najwyższy istniejący `ADR-NNNN` + 1, format czterocyfrowy
   (np. po `ADR-0007` → `ADR-0008`). Nie zmieniaj numerów wcześniejszych wpisów.
4. Zbuduj wpis z szablonu `templates/decision-log-entry.md`:
   ```
   ### ADR-NNNN — <tytuł>
   - Status: <proponowana | zaakceptowana | odrzucona | wycofana>
   - Data: <YYYY-MM-DD>
   **Kontekst** — problem i siły, które wymusiły decyzję.
   **Decyzja** — co zostało postanowione (jednoznacznie).
   **Konsekwencje** — skutki pozytywne i negatywne, kompromisy, co staje się trudniejsze.
   ```
5. Dopisz wpis na KOŃCU logu. Powiąż go z projektem [[20-projects/...]] lub runbookiem
   [[40-runbooks/...]], jeśli decyzja z nich wynika.
6. Zaktualizuj `updated:` we frontmatterze `decision-log.md` na dziś.
7. Wypisz raport: numer ADR, tytuł, status.

## Czego skill NIE robi
- nie nadpisuje ani nie renumeruje istniejących ADR;
- nie wymyśla kontekstu ani konsekwencji — brak danych oznacza jako otwarty wątek;
- nie ustawia statusu `zaakceptowana` bez potwierdzenia operatora;
- nie commituje ani nie pushuje (to robi [[end-day]]).
