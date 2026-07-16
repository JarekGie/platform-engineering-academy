---
title: Questions for hosts — Kubernetes 03: ReplicaSet i skalowanie
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-07-13
updated: 2026-07-13
tags: [podcast, questions, notebooklm, kubernetes]
---

## Pytania prowadzące (od ogółu do konkretu)

1. Czym różni się skalowanie horyzontalne od wertykalnego i dlaczego Kubernetes stawia na horizontal?
2. Do czego służą **labels**, a do czego **annotations** — i dlaczego tylko po labelach robi się selekcję?
3. Jak działa **ReplicaSet** — co dokładnie utrzymuje i jak używa **selectora**, żeby znaleźć swoje Pody?
4. Co się stanie, gdy skasuję jeden z Podów zarządzanych przez ReplicaSet? A gdy zmienię `replicas`?
5. Jak wykonać ręczne skalowanie (`kubectl scale`) i co dzieje się z Podami krok po kroku?
6. Kiedy skalujemy same Pody, a kiedy trzeba skalować klaster (dodać nodes)?

## Pytania pogłębiające (dla wyższych poziomów, 3–5)

- Dlaczego w praktyce prawie nigdy nie tworzymy ReplicaSet wprost, tylko przez Deployment?
- Co się stanie, gdy selektor ReplicaSet pasuje do „obcego" Poda utworzonego ręcznie z tymi samymi labelami?
- Jak dobór etykiet wpływa na to, że Service kieruje ruch do właściwych Podów?

## Powiązane
[[podcast-brief]], [[glossary]].
