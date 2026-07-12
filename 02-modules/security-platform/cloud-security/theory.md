---
title: Cloud Security — teoria
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
tags: [module, security-platform, cloud-security, theory]
---

## Zakres modułu

Baseline bezpieczeństwa chmury (AWS-first, z odniesieniem do GKE): wykrywanie zagrożeń, posture
management i guardrails na poziomie organizacji. Cel: kompetencja pozwalająca ustawić i utrzymać
bezpieczną bazę konta/organizacji (dowód: `ev-csec-001`).

## Koncepty i mental models

- Model współodpowiedzialności (shared responsibility): granica dostawca ↔ zespół.
- Warstwy kontroli: tożsamość (IAM), sieć (VPC/WAF/SG), dane (KMS), detekcja (GuardDuty), agregacja (Security Hub).
- Posture vs detekcja: CSPM (stan konfiguracji) kontra threat detection (zdarzenia).
- Guardrails jako granica: SCP jako polityka na całą organizację, nie per-konto.
- Least privilege jako domyślny stan — powiązanie z [[theory|identity-and-access]].

## Powiązane w module

- Źródła: [[resources]]
- Laby: [[labs]] (praktyka w [[03-labs]])
- Sprawdzenie: [[assessment]]
- Dowód: [[evidence]]
- Homelab: [[07-homelab/security/guardduty|guardduty]], [[07-homelab/security/security-hub|security-hub]]
