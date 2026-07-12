---
title: Adaptive roadmap
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
roadmap_version: 1
created: 2026-07-12
updated: 2026-07-12
tags: [academy, roadmap, adaptive]
---

## Current State

Cel: **Senior Platform Engineer** ([[current-goal]]). Profil: mocny fundament chmury —
AWS 5+ lat, Terraform 3–5 lat, FinOps ~1 rok (realny Mid w Cloud i FinOps). Rdzeń platformowy
(Kubernetes → GitOps → IDP) i Security są dopiero do zbudowania. Styl nauki: **podcast-first**,
sesje **25 min**, checkpoint co tydzień, reassessment co miesiąc ([[learning-preferences]]).
Baza kalibracji: [[assessment-baseline]] (`assessment_version: 1`).

## Skill Matrix

| Filar | Teraz (0–5) | Cel (0–5) | Luka |
| --- | --- | --- | --- |
| Cloud | 2 Mid | 3 Senior | +1 (sieć multi-account, IAM workloadów, sekrety) |
| Platform (IDP) | 0 Beginner | 2 Mid | +2 (Backstage/Crossplane) |
| Kubernetes | 1 Junior | 3 Senior | +2 (rdzeń — priorytet) |
| GitOps | 1 Junior | 3 Senior | +2 (ArgoCD/Flux) |
| Security | 0 Beginner | 2 Mid | +2 (IAM, sekrety, guardrails) |
| AI | 1 Junior | 1–2 | +0/1 (utrzymanie, nie priorytet) |
| FinOps | 2 Mid | 2–3 | atut do utrzymania i pogłębienia |

## Największe luki

Priorytetyzacja pod cel Senior Platform Engineer:
1. **Kubernetes (blokujący)** — bez solidnego K8s nie ma GitOps ani IDP. Fundament nr 1.
2. **GitOps** — naturalne przedłużenie: Terraform (masz) + K8s (budujesz) → ArgoCD/Flux.
3. **Cloud depth** — sieć multi-account, IAM dla workloadów (ECS/EKS task roles), sekrety.
4. **Security (podstawy)** — IAM least-privilege, zarządzanie sekretami, guardrails.
5. **Platform/IDP** — Backstage/Crossplane na koniec, gdy rdzeń stoi.

## Roadmap 90 dni — "Fundament Kubernetes"

Cel: podnieść Kubernetes 1 → 2 i domknąć pierwszy dowód.
- Moduł `02-modules/kubernetes/` — teoria: architektura, workload controllers (Deployment vs
  StatefulSet vs DaemonSet), Service/Ingress, ConfigMap/Secret, requests/limits, RBAC.
- Podcast-first: seria How-To K8s (NotebookLM) na wejście do każdego tematu.
- Laby (`03-labs/`): postawienie klastra (homelab/kind/minikube → potem EKS), deploy aplikacji,
  self-healing, rolling update.
- Assessment K8s (`04-assessments/`) + **evidence `ev-k8s-001`** (`05-evidence/`).
- Utrzymanie atutu: 1 mini-lab FinOps (rightsizing / raport kosztów).

## Roadmap 180 dni — "GitOps + Cloud depth"

Cel: Kubernetes 2 → 3, GitOps 1 → 2/3, Cloud 2 → 2.5.
- Moduł GitOps: ArgoCD (i przegląd Flux), Helm w praktyce, deploy przez Git jako źródło prawdy.
  Lab: pełny GitOps flow na klastrze z etapu 90-dniowego. Evidence: `ev-gitops-001`.
- Cloud depth: sieć multi-account (Transit Gateway), IAM dla workloadów, AWS Secrets Manager /
  SSM Parameter Store dla sekretów w ECS/EKS. Evidence: `ev-cloud-net-001`.
- Homelab (`07-homelab/`): spięcie K8s + GitOps jako trwałe środowisko + ADR.

## Roadmap 365 dni — "Platforma + Security + Senior evidence"

Cel: dobicie profilu do Senior Platform Engineer.
- Platform/IDP: Backstage (developer portal) i/lub Crossplane (control plane) — lab + koncept.
- Security: least-privilege IAM, zarządzanie sekretami (opcjonalnie Vault), guardrails/policy
  (SCP, OPA/Kyverno na K8s). Podniesienie Security 0 → 2.
- Real Project (`08-real-projects/`): end-to-end platforma (IaC → K8s → GitOps → koszty →
  guardrails) jako flagowy dowód Senior. Evidence: `ev-platform-real-001`.
- Utrzymanie FinOps jako atutu różnicującego (FinOps na platformie).

## Uwaga
Ten plik trzyma **plan**. Bieżący wskaźnik stanu (active_module, next_action, wersje) trzyma
[[academy-state]] — nie duplikuj tam tych danych.

## Powiązane
[[academy-state]], [[current-goal]], [[assessment-baseline]], `01-roadmap/`.
