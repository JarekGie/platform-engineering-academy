---
title: Checkpoint history
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
tags: [academy, checkpoint, history]
---

## Dziennik checkpointów (append-only)

Każda komenda `checkpoint` ([[academy-coach]]) dopisuje wpis. Nie nadpisuj starych wpisów —
to historia ewolucji kompetencji.

### Wzór wpisu

```
### <data> — checkpoint
- assessment_version: <n>
- roadmap_version: <n>
- active_pillar / active_module: <...>
- zmiany od ostatniego: <co się ruszyło, jakie evidence>
- next_action: <...>
```

## Wpisy

_Brak — pierwszy checkpoint dopisze [[academy-coach]] po uruchomieniu `checkpoint`._

## Powiązane
[[academy-state]], [[assessment-baseline]], [[adaptive-roadmap]].
