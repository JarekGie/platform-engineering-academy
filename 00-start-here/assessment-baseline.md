---
title: Assessment baseline
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
assessment_version: 1
created: 2026-07-12
updated: 2026-07-12
tags: [academy, assessment, baseline]
---

## Kontekst

Wynik assessmentu bazowego wygenerowany przez [[academy-coach]] (Etap 3–4 onboardingu, 2026-07-12).
Pomiar realny (nie deklarowany): pytania adaptacyjne w mocnych obszarach. Pole `assessment_version`
podbijaj przy każdym `reassessment` (1 = pierwszy pomiar).

## Kalibracja filarów (0–5)

| Filar | Poziom (0–5) | Uzasadnienie (dowód/obserwacja) |
| --- | --- | --- |
| Cloud (AWS/IaC) | 2 Mid | Terraform solidnie (state, backend S3, locking, moduły, env-per-katalog); koszty/rachunek ogarnięte. Luki: sieć multi-account (Transit Gateway), IAM dla workloadów (ECS task role), zarządzanie sekretami, security services. |
| Platform (IDP) | 0 Beginner | Backstage, Crossplane — brak kontaktu. Terragrunt/Ansible tylko podstawy. |
| Kubernetes | 1 Junior | Laby wprowadzające; fundament kruchy (nie zna różnicy Deployment vs StatefulSet). EKS/ECS/GKE tylko laby. |
| GitOps | 1 Junior (low) | Tylko Helm na poziomie labów. ArgoCD, Flux — brak. |
| Security | 0 Beginner | Vault, CrowdStrike, GuardDuty, Security Hub, AI Security — brak. SG vs NACL: rozumienie częściowe. |
| AI | 1 Junior | LLM na poziomie labów. RAG, AI Security — brak. |
| FinOps | 2 Mid | Najmocniejszy realny obszar: Cost Explorer (grupowanie po serwisie/tagach), Savings Plans/RI, Spot, schedulery non-prod. ~1 rok produkcyjnie. |

Skala: 0 Beginner · 1 Junior · 2 Mid · 3 Senior · 4 Advanced Senior · 5 Staff Track.

## Największe luki

Zależne od celu ([[current-goal]] — ustawiany w Etapie 5). Wstępnie, względem roli Platform Engineer:
- **Kubernetes** — fundament (workload controllers, sieć, storage) do zbudowania od podstaw.
- **GitOps** — ArgoCD/Flux od zera; naturalne przedłużenie Terraform + K8s.
- **Cloud depth** — sieć multi-account, IAM dla workloadów, sekrety, security services.
- **Security** — cały filar praktycznie od zera.

## Powiązane
[[learning-profile]], [[current-goal]], [[adaptive-roadmap]], [[academy-state]].
