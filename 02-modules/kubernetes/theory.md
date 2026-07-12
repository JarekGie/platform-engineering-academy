---
title: Kubernetes — teoria
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
tags: [module, kubernetes, theory]
---

## Zakres modułu

Podstawy Kubernetes: architektura klastra, obiekty API, harmonogramowanie, sieć, storage.
Cel: kompetencja operatorska pozwalająca zbudować i utrzymać klaster (dowód: `ev-k8s-001`).

## Koncepty i mental models

- Control plane vs data plane; deklaratywny model stanu (reconcile loop).
- Obiekty: Pod, Deployment, Service, Ingress, ConfigMap/Secret, PVC.
- Harmonogramowanie: requests/limits, taints/tolerations, affinity.

## Powiązane w module

- Źródła: [[resources]]
- Laby: [[labs]] (praktyka w [[03-labs]])
- Sprawdzenie: [[assessment]]
- Dowód: [[evidence]]
