# Polityka podcastow (skrot) — platform-engineering-academy

To skrot operacyjny. Pelna, wiazaca polityka: [[PODCAST_EXPORT_POLICY]] w `_system/`.

## Cel
Okreslic, kiedy i jak materialy z vaulta moga stac sie podcastem.

## Zasady kluczowe
- Podcast **nie jest** source of truth.
- Eksport tylko z notatek o `podcast_export: allowed` lub `allowed_after_review`.
- `allowed_after_review` wymaga compliance gate ([[COMPLIANCE_REVIEW_CONTRACT]]).
- Status podcastu: draft | pending_compliance_review | approved | rejected | archived.
- Gotowe pliki audio i transkrypty trzymaj w `artifacts/`.

Szczegoly i procedura przegladu: [[PODCAST_EXPORT_POLICY]].
