---
title: Lab: GitOps z ArgoCD
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
tags: [lab, gitops, kubernetes]
---

## Objective

Wdrożyć GitOps na klaster Kubernetes za pomocą ArgoCD: aplikacja synchronizowana z repo Git,
automatyczny reconcile stanu. Dowód: `ev-gitops-001`.

## Prerequisites

- Działający klaster ([[07-homelab]] lub kind/minikube),
- `kubectl` skonfigurowany, dostęp do repo Git,
- moduł [[theory|kubernetes/theory]] przerobiony.

## Implementation

1. Zainstaluj ArgoCD w namespace `argocd`.
2. Podłącz repozytorium z manifestami aplikacji.
3. Zdefiniuj `Application` wskazujący ścieżkę w repo.
4. Włącz auto-sync i self-heal.

## Validation

- `argocd app get <app>` pokazuje status `Synced` i `Healthy`,
- ręczna zmiana w klastrze jest cofana przez reconcile (self-heal),
- commit do repo propaguje się bez ręcznej interwencji.

## Troubleshooting

| Objaw | Prawdopodobna przyczyna | Rozwiązanie |
| --- | --- | --- |
| App `OutOfSync` mimo commita | webhook/poll nie działa | wymuś `argocd app sync`, sprawdź dostęp do repo |
| `Degraded` | błędny manifest / brak zasobów | `kubectl describe`, popraw manifest w repo |

## Generated evidence

- `evidence_id`: `ev-gitops-001`
- `skill`: GitOps / Continuous Delivery
- `module`: kubernetes
- `lab`: lab-gitops-argocd
- `source_ref`: <repo-url>/argocd  (uzupełnij)
- `verification_status`: unverified

Zarejestruj dowód w [[evidence-register]].
