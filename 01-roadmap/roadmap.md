---
title: Roadmapa academy — ścieżka nauki
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
tags: [roadmap, pipeline]
---

## Cel ścieżki

Jaką kompetencję/rolę buduje ta academy (np. „Platform Engineer", „Kubernetes Operator")
i dla kogo (odbiorca publiczny / open source).

## Kolejność modułów

| # | Moduł (`02-modules/<temat>/`) | Warunek wstępny | Oczekiwany dowód (evidence_id) |
| --- | --- | --- | --- |
| 1 | [[theory\|kubernetes]] | — | ev-k8s-001 |
| 2 | [[theory\|security-platform/cloud-security]] | — | ev-csec-001 |
| 3 | [[theory\|security-platform/identity-and-access]] | cloud-security | ev-iam-001 |
| 4 | [[theory\|security-platform/secrets-management]] | — | ev-secr-001 |
| 5 | [[theory\|security-platform/security-governance]] | cloud-security, identity-and-access | ev-gov-001 |

## Kamienie milowe

- Kamień 1 — fundament Security (horyzont 30 dni): `cloud-security` + `identity-and-access`
  (teoria + lab), homelab security stoi (GuardDuty + Security Hub + Vault); dowody
  `ev-csec-001`, `ev-iam-001`.
- Kamień 2 — moduł/lab/egzamin, termin, dowód.

## Filar Security Platform Engineering

Security Platform Engineering to równorzędny filar (pillar-group `02-modules/security-platform/`).
Faza 1 pokrywa fundament: `cloud-security`, `identity-and-access`, `secrets-management`,
`security-governance`. Tracki `crowdstrike`, `detection-engineering`, `incident-response`,
`cloud-forensics`, `ai-security`, `ai-secops` są planowane (Faza 2+). Indeks:
[[security-platform/README|security-platform]].

## Mapowanie na pipeline

Roadmap → Theory (`02-modules`) → Lab (`03-labs`) → Assessment (`04-assessments`)
→ Homelab (`07-homelab`) → Evidence (`05-evidence`) → Real Project (`08-real-projects`).

## Powiązane

[[certification-roadmap]], [[evidence-register]], [[homelab-architecture]].
