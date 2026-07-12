# Kontrakt NotebookLM (skrot) — platform-engineering-academy

To skrot operacyjny. Pelny, wiazacy kontrakt: [[NOTEBOOKLM_CONTRACT]] w `_system/`.

## Cel
Okreslic, jakie tresci wolno wprowadzac do NotebookLM i jak traktowac wyniki.

## Zasady kluczowe
- NotebookLM **nie jest** source of truth — prawda zostaje w vaultcie.
- Zrodlo musi miec status `approved` w [[sources]] przed uzyciem.
- Jedna sesja = jedna domena wrazliwosci ([[DOMAIN_ISOLATION_CONTRACT]]).
- Tresci `llm_exposure: forbidden` nie trafiaja do NotebookLM nigdy.
- Wyniki zapisuj w `findings/` i `artifacts/`, oznaczaj pochodzenie.

Szczegoly, wyjatki i procedura zatwierdzania: [[NOTEBOOKLM_CONTRACT]].
