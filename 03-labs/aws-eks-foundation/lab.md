---
title: Lab — fundament klastra EKS (aws-eks-foundation)
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-15
updated: 2026-07-15
tags: [lab, kubernetes, eks, terraform, aws]
lab_id: aws-eks-foundation
status: planned
module: kubernetes
evidence_id: ev-eks-001
cost_estimate: "EKS control plane + node group płatne /h; teardown wymagany"
teardown_required: true
---

## Objective

Zbudować minimalny fundament klastra Amazon EKS w Terraform i dowieść kompetencji provisioning +
walidacja klastra zarządzanego. Dowód: `ev-eks-001`. Domyka krok Lab modułu `kubernetes`
(po lokalnych labach minikube [[lab-minikube-qemu-klaster]]).

## Hipotezy

- Managed node group wystarczy do postawienia węzłów `Ready` bez ręcznej konfiguracji kubelet.
- `terraform validate` + `tflint` + security scan wyłapią większość błędów przed jakimkolwiek apply.

## Prerequisites

- Przerobiona teoria K8s (architektura klastra, workload controllers).
- Terraform + konto AWS z uprawnieniami do VPC/EKS/IAM (do przyszłego apply — poza szkieletem).
- Świadomość kosztu i teardownu ([[public-lab-security-standard]], `cost.md`).

## Implementation

Kod w `infra/terraform/` (na etapie szkieletu — brak `.tf`; planowana zawartość w
`infra/terraform/README.md`). Zasady kodu: [[lab-code-standard]].

1. Sieć: VPC + subnety.
2. Control plane EKS.
3. Managed node group.
4. Outputs (endpoint, nazwa klastra) — bez wartości wrażliwych.

## Validation

- `kubectl get nodes -o wide` → węzły w stanie `Ready` (gdy klaster powstanie).
- Statyczna walidacja kodu: `make fmt validate lint` (gdy istnieją pliki `.tf`).

## Completion criteria (Definition of Done)

- kod uruchamialny, walidacja przechodzi; README + teardown + koszt kompletne;
- `evidence.md` z commit SHA i wynikami walidacji; wpis `ev-eks-001` w [[evidence-register]];
- brak zakazanych artefaktów (public-safe).

## Troubleshooting

| Objaw | Przyczyna | Rozwiązanie |
| --- | --- | --- |
| _uzupełnij w trakcie pracy_ | | |

## Generated evidence

- `evidence_id`: `ev-eks-001`
- `skill`: provisioning i walidacja klastra EKS (Terraform)
- `module`: [[theory|kubernetes]]
- `lab`: [[03-labs/aws-eks-foundation/lab|aws-eks-foundation]]
- `source_ref`: `03-labs/aws-eks-foundation/...@<commit-sha>`
- `verification_status`: unverified

Szczegółowy dowód: `evidence.md`. Rejestracja po wyprodukowaniu dowodu: [[evidence-register]].
