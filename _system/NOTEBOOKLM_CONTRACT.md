## Cel
Kontrakt korzystania z NotebookLM dla vaultów z modułem `90-reference/notebooklm/`. Określa dozwolone źródła, zatwierdzanie, oznaczanie i miejsce zapisu wyników.

## Zakres
Obowiązuje każdą pracę z NotebookLM nad materiałem z vaulta. Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Co może być źródłem
- Tylko notatki z `notebooklm_source: approved`.
- `candidate` czeka na zatwierdzenie i nie może być źródłem; `rejected` i `false` — nigdy.
- Dodatkowo źródło musi mieć dopuszczalne `llm_exposure` (patrz [[LLM_CONTEXT_BOUNDARY_CONTRACT]]).

## Kto zatwierdza źródło
Zmianę `notebooklm_source` na `approved` wykonuje compliance lub owner notatki. Bez tej akceptacji notatka pozostaje `candidate`.

## Jak oznaczać źródła
- Frontmatter notatki: `notebooklm_source: approved`.
- Rejestr w `90-reference/notebooklm/sources.md`: lista zatwierdzonych źródeł z datą i osobą zatwierdzającą.

## Gdzie zapisywać wyniki
- Surowe wyniki/odpowiedzi: `90-reference/notebooklm/findings/`.
- Synteza: jako notatka vaulta zgodna z kontraktem notatki ([[AGENTS]]), z pełnym frontmatterem.
- Drafty podcastu i artefakty: zgodnie z [[PODCAST_EXPORT_POLICY]] (`90-reference/notebooklm/artifacts/` lub `conversations/`).

## Sprzeczności
Vault wygrywa. NotebookLM NIE jest source of truth. Przy rozbieżności poprawia się notatkę vaulta tylko po weryfikacji u właściciela, nigdy automatycznie wynikiem z NotebookLM.

## Czego nie eksportować
- `classification: restricted`;
- `confidential` bez `compliance_review: approved`;
- dane klientów i dane osobowe.

## Workflow
vault → wyselekcjonowane źródła (`approved`) → NotebookLM → synteza → notatka vaulta → draft podcastu → compliance review ([[COMPLIANCE_REVIEW_CONTRACT]]) → zatwierdzony artefakt.

## Powiązane kontrakty
[[AGENTS]], [[PODCAST_EXPORT_POLICY]], [[COMPLIANCE_REVIEW_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]].
