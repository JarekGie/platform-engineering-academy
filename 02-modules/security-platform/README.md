---
title: Security Platform Engineering — filar (pillar-group)
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
tags: [module, security-platform, pillar, index]
---

## Czym jest ten filar

Security Platform Engineering to **równorzędny filar Academy** (obok Platform Engineering),
zrealizowany jako **grupa modułów (pillar-group)** wewnątrz `02-modules/`. Każdy submoduł zachowuje
kontrakt modułu: pięć plików (`theory`, `resources`, `labs`, `assessment`, `evidence`) i przechodzi
przez ten sam pipeline: Roadmap → Theory → Lab → Assessment → Homelab → Evidence → Real Project.

Konwencja: `02-modules/` może zawierać moduł **płaski** (np. `kubernetes/`) albo **pillar-group**
z submodułami (`security-platform/<submoduł>/`). Szczegóły w [[02-modules/README|README modułów]].

## Submoduły

### Faza 1 — fundament (obecny stan)

| Submoduł | Zakres | Namespace evidence |
| --- | --- | --- |
| [[theory\|cloud-security]] | Baseline bezpieczeństwa chmury (GuardDuty, Security Hub, SCP, CSPM) | `ev-csec-NNN` |
| [[theory\|identity-and-access]] | IAM/RBAC, least privilege, MFA, break-glass | `ev-iam-NNN` |
| [[theory\|secrets-management]] | Vault/OpenBao, KV, dynamic secrets, rotacja | `ev-secr-NNN` |
| [[theory\|security-governance]] | Guardrails-as-code, control mapping, evidence-of-control | `ev-gov-NNN` |

### Faza 2+ — planowane (zależne od knowledge transferu CrowdStrike i rozwoju roadmapy)

`crowdstrike`, `detection-engineering`, `incident-response`, `cloud-forensics`,
`ai-security`, `ai-secops` — **jeszcze nie utworzone**. Detection Engineering i Incident Response
wprowadzą dodatkowy sub-pipeline dowodowy: Detection → Response → Lessons Learned.

## Namespace evidence (słownik prefixów)

Format stabilny: `ev-<skrót>-NNN`. Prefiksy Fazy 1: `ev-csec` (cloud-security),
`ev-iam` (identity-and-access), `ev-secr` (secrets-management — celowo `secr`, nie `sec`,
by uniknąć kolizji z ogólnym „security"), `ev-gov` (security-governance).
Rejestr: [[evidence-register]].

## Granica bezpieczeństwa

Treść dydaktyczna tego filaru jest w domenie `learning` (`classification: internal`,
`llm_exposure: allowed_internal_only`). Realne wdrożenia produkcyjne DC/MakoLab **nie wchodzą**
jako treść — istnieją wyłącznie jako sanityzowane case studies w [[08-real-projects]]
(model: [[08-real-projects/security/README|real-projects/security]]).

## Powiązane

[[roadmap]], [[evidence-register]], [[07-homelab/security/threat-model|homelab/security]].
