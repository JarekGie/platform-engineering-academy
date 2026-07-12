---
title: Learning preferences
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
tags: [academy, preferences]
---

## Preferencje nauki

Academy adaptuje sposób prowadzenia nauki do uczącego się. Pola wypełnia [[academy-coach]]
podczas onboardingu (`początek`) i aktualizuje przy `checkpoint`/`reassessment`.

| Pole | Wartość | Dozwolone / przykład |
| --- | --- | --- |
| preferred_learning_style | _pusty_ | podcast-first / hands-on-first / reading-first / mixed |
| preferred_session_length | _pusty_ | 25 min / 45 min / 90 min |
| podcast_enabled | _pusty_ | true / false |
| notebooklm_enabled | _pusty_ | true / false |
| checkpoint_frequency | _pusty_ | co tydzień / co 2 tygodnie / co miesiąc |
| assessment_frequency | _pusty_ | co miesiąc / co kwartał |

## Jak wpływają na Academy

- `preferred_learning_style` → [[academy-learning-loop]] proponuje kolejny krok zgodny ze stylem.
- `podcast_enabled` / `notebooklm_enabled` → warunkują [[academy-podcasts]] (musi być też `notebooklm: true` w manifeście).
- `checkpoint_frequency` / `assessment_frequency` → rytm przypominania o `checkpoint` i `reassessment`.

## Powiązane
[[academy-state]], [[current-goal]], [[academy-coach]].
