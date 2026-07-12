---
name: academy-learning-loop
description: >
  Najważniejszy skill Academy — spina naukę w pętlę Podcast → Theory → Lab → Assessment → Evidence.
  Aktywuj gdy uczący się domyka materiał lub chce następny krok praktyki: triggery
  "skończyłem podcast", "następny lab", "następny moduł". Prowadzi krótką retrospekcję,
  proponuje kolejny krok i nawiguje pipeline oraz evidence.
allowed-tools:
  - Read
  - Edit
  - Write
skill_name: academy-learning-loop
mandatory: false
enforcement: soft
allow_workaround: true
on_failure: warn
---

## Cel
Zamienić bierną konsumpcję (podcast/teoria) w domkniętą pętlę zakończoną dowodem. To spoiwo
Academy: każdy materiał ma prowadzić do praktyki i evidence.

## Zakres i granice
- Domena: `learning`. Nie miesza domen ([[DOMAIN_ISOLATION_CONTRACT]]).
- Nawiguje `02-modules/`, `03-labs/`, `04-assessments/`, `05-evidence/` i aktualizuje
  `00-start-here/academy-state.md` (przez współpracę z [[academy-coach]]).
- Nie eksportuje na zewnątrz.

## Pętla nauki
```
Podcast → Theory → Lab → Assessment → Evidence
```

## Komenda `skończyłem podcast`
1. Zapytaj: **„Jakie 3 rzeczy zapamiętałeś?"** (czekaj na odpowiedź).
2. Zapytaj: **„Jak oceniasz zrozumienie? (1–5)"**.
3. Na podstawie oceny zaproponuj kolejny krok:
   - ocena 1–2 → `teoria` (powrót do [[02-modules]] danego tematu) lub ponowny odsłuch,
   - ocena 3 → `lab` (praktyka w [[03-labs]]),
   - ocena 4 → `quiz` / mini-sprawdzenie,
   - ocena 5 → `assessment` ([[04-assessments]]) → droga do evidence.
4. Zapisz krótką notatkę pętli (szablon `templates/loop-note.md`) i zaktualizuj `next_action`
   w [[academy-state]].

## Komenda `następny lab`
Przenieś do praktyki: wskaż konkretny lab z [[03-labs]] powiązany z aktywnym modułem
([[academy-state]] → `active_module`). Przypomnij, że lab kończy się `evidence_id`
w [[evidence-register]].

## Komenda `następny moduł`
Wybierz kolejny krok z [[adaptive-roadmap]] (kolejność modułów, największe luki), ustaw
`active_module` i `next_action` w [[academy-state]], potwierdź warunki wstępne modułu.

## Evidence-first
Pętla nie jest domknięta, dopóki krok praktyczny nie wyprodukuje dowodu (`evidence_id`).
Dowód rejestruj w [[evidence-register]] (federacja `source_system: academy`).

## Powiązane
[[academy-coach]], [[academy-podcasts]], [[academy-state]], [[adaptive-roadmap]], [[evidence-register]].
