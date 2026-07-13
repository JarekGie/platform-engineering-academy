---
title: Questions for hosts — Kubernetes 02: workload controllers
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-07-12
updated: 2026-07-12
tags: [podcast, questions, notebooklm, kubernetes]
---

## Pytania prowadzące (od ogółu do konkretu)

1. Dlaczego nie tworzymy Podów bezpośrednio — po co warstwa controllerów?
2. Czym zajmuje się **Deployment** i jak wykorzystuje **ReplicaSet** pod spodem?
3. Jak działa **rolling update** i **rollback** w Deployment — co daje deklaratywność?
4. Kiedy Deployment NIE wystarcza i wchodzi **StatefulSet**? Co konkretnie StatefulSet gwarantuje
   (tożsamość, kolejność, **PVC per Pod**), czego Deployment nie daje?
5. Do czego służy **DaemonSet** i czym różni się od pozostałych (jeden Pod na node)?
6. Tabela decyzyjna: mam aplikację X (API bezstanowe / baza / agent logów) — który controller i dlaczego?

## Pytania pogłębiające (dla wyższych poziomów, 3–5)

- Dlaczego bazy danych na Kubernetes to StatefulSet + PVC, a nie Deployment ze współdzielonym wolumenem?
  Co pójdzie nie tak przy Deployment?
- Co się dzieje z danymi, gdy Pod StatefulSet `app-1` zostanie usunięty i odtworzony? Jak działa
  ponowne podpięcie PVC?
- Jak headless Service i stabilne DNS umożliwiają działanie klastrów stanowych (np. replikacja bazy)?

## Powiązane
[[podcast-brief]], [[glossary]].
