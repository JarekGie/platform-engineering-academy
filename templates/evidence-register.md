---
title: Rejestr dowodów academy (evidence register)
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-12
tags: [evidence, register, pipeline]
---

## Kontekst

Academy jest producentem evidence; Career OS konsumuje przez `source_system: academy` + `source_ref`.
To indeks producenta — pełna treść (laby/artefakty) zostaje w tym vaulcie.

## Rejestr

| evidence_id | skill | module | lab | verification_status | source_ref |
| --- | --- | --- | --- | --- | --- |
| ev-<temat>-001 | _uzupełnij_ | | | unverified | |

## Federacja (Academy → Career OS)

Career OS importuje wpis jako `source_system: academy`, `source_ref: <academy-vault>#<evidence_id>`.
Nie duplikuj treści między vaultami.
