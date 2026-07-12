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

### 2026-07-12 — onboarding (baseline)
- assessment_version: 1
- roadmap_version: 1
- active_pillar / active_module: Kubernetes / kubernetes
- zmiany od ostatniego: pierwszy pomiar. Kalibracja — Cloud 2, FinOps 2, Kubernetes 1,
  GitOps 1, AI 1, Platform 0, Security 0. Cel: Senior Platform Engineer. Styl: podcast-first, 25 min.
- next_action: wejść w moduł `02-modules/kubernetes/` (teoria workload controllers), podcast-first.

## Powiązane
[[academy-state]], [[assessment-baseline]], [[adaptive-roadmap]].
