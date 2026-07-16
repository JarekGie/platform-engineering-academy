---
title:
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
tags: [lab, evidence]
# evidence_id:  # ev-<temat>-NNN
# lab_id:
---

## Kontekst

Dowód wykonania laba `<lab-id>`. Rozdziela deklarację, fakt zweryfikowany i GAP — nie „repo działa".

## FACT — fakty zweryfikowane

- kod: `03-labs/<lab-id>/...` @ commit `<sha>`
- `terraform validate`: <wynik> · `tflint`: <wynik> · security scan: <wynik>
- wynik CI: <link/opis> · walidacja obserwowalna: <komenda + wynik po sanityzacji>

## EVIDENCE — deklaracja operatora

- co twierdzę, że umiem/zrobiłem (własnymi słowami), oparte na powyższych faktach.

## GAP — czego brakuje

- brakujące dowody / niezweryfikowane elementy / narzędzia niedostępne lokalnie (jawnie, nie cicho).

## Problemy i rozwiązania

| Problem | Przyczyna | Rozwiązanie |
| --- | --- | --- |
| _uzupełnij_ | | |

## Rejestracja

- `evidence_id`: `ev-<temat>-NNN`
- `verification_status`: unverified | self-verified | externally-verified
- powiązany assessment: <link>

Zarejestruj/aktualizuj w [[evidence-register]]. Zasady dowodu: [[lab-code-standard]].
Sanityzacja logów: [[public-lab-security-standard]].
