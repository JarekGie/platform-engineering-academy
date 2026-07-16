---
title: Architektura — aws-eks-foundation
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
tags: [lab, architecture, eks]
lab_id: aws-eks-foundation
---

## Komponenty (planowane)

- **VPC + subnety** → izolacja sieciowa klastra.
- **EKS control plane** → zarządzany API server / etcd.
- **Managed node group** → węzły robocze.
- **IAM roles** → least privilege dla klastra i węzłów.
- **Outputs** → nazwa klastra, endpoint (bez wartości wrażliwych).

## Przepływy

- operator → Terraform → AWS API (provisioning);
- `kubectl` → endpoint EKS (walidacja: węzły `Ready`).

## Diagram

```
[operator] --terraform--> [AWS: VPC -> EKS control plane -> managed node group]
                                                  ^
                                       [kubectl get nodes] (walidacja)
```

## Założenia

- pojedyncze środowisko (bez multi-env na starcie — Terragrunt dopiero przy realnej potrzebie);
- region i identyfikatory jako placeholdery/zmienne, nigdy realne wartości w repo.

## Trade-offy

- **managed node group vs self-managed**: prostota i mniej utrzymania kontra mniejsza kontrola —
  na labie wybieramy managed. Istotne decyzje trafiają do [[decision-log]].

Powiązane: [[lab-code-standard]], [[decision-log]].
