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
| preferred_learning_style | podcast-first | podcast-first / hands-on-first / reading-first / mixed |
| preferred_session_length | 25 min | 25 min / 45 min / 90 min |
| podcast_enabled | true | true / false |
| notebooklm_enabled | true | true / false |
| checkpoint_frequency | co tydzień | co tydzień / co 2 tygodnie / co miesiąc |
| assessment_frequency | co miesiąc | co miesiąc / co kwartał |

## Jak wpływają na Academy

- `preferred_learning_style` = podcast-first → [[academy-learning-loop]] i [[academy-podcasts]]
  zaczynają krok od materiału podcastowego (NotebookLM), potem teoria i lab.
- `preferred_session_length` = 25 min → kroki cięte na krótkie porcje (jeden podcast + jeden mały ruch).
- `podcast_enabled` / `notebooklm_enabled` = true → [[academy-podcasts]] aktywny (manifest ma `notebooklm: true`).
- `checkpoint_frequency` = co tydzień → cotygodniowe przypomnienie o `checkpoint`.
- `assessment_frequency` = co miesiąc → miesięczny `reassessment` z porównaniem do [[assessment-baseline]].

## Powiązane
[[academy-state]], [[current-goal]], [[academy-coach]].
