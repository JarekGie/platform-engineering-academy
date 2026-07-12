## Cel
Polityka generowania i eksportu podcastów (np. z NotebookLM) na bazie materiałów vaulta. Określa, co może wejść do podcastu, kiedy wymagany jest review i jak oznaczać status.

## Zakres
Obowiązuje każdy draft i artefakt audio powstały z treści vaulta. Uzupełnia [[NOTEBOOKLM_CONTRACT]] i [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Kiedy można generować podcast
- Gdy materiał źródłowy ma `podcast_export: allowed`, lub
- `podcast_export: allowed_after_review` po przejściu compliance review ([[COMPLIANCE_REVIEW_CONTRACT]]).
- `podcast_export: forbidden` — nigdy.

## Jakie materiały mogą wejść
- Tylko notatki z `podcast_export: allowed` lub `allowed_after_review` (po review).
- Spójne z `llm_exposure` (patrz [[LLM_CONTEXT_BOUNDARY_CONTRACT]]) — bez `forbidden`, bez `restricted`/`confidential`.
- Jedna domena na podcast (patrz [[DOMAIN_ISOLATION_CONTRACT]]).

## Kiedy wymagany compliance review
- Zawsze dla `allowed_after_review` przed publikacją.
- Zawsze gdy materiał dotyka danych klientów, danych osobowych, architektury bezpieczeństwa lub informacji kontraktowych.

## Gdzie zapisywać
- Draft: `90-reference/notebooklm/artifacts/` lub `90-reference/notebooklm/conversations/`.
- Zaakceptowany artefakt: pozostaje w `artifacts/` z oznaczeniem `approved` i odnośnikiem do decyzji review.

## Jak oznaczać status
Każdy draft/artefakt opisany blokiem statusu:
```yaml
podcast_status: draft        # draft | pending_compliance_review | approved | rejected | archived
podcast_export: allowed_after_review
compliance_review: required  # patrz COMPLIANCE_REVIEW_CONTRACT
source_note:                 # [[wiki-link]] do notatki źródłowej w vaultcie
```
Przejścia: `draft` → `pending_compliance_review` → `approved` lub `rejected`; nieaktualne artefakty → `archived`.

## Powiązane kontrakty
[[NOTEBOOKLM_CONTRACT]], [[COMPLIANCE_REVIEW_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[AGENTS]].
