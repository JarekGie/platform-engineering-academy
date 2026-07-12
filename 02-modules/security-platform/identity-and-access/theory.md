---
title: Identity & Access — teoria
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
tags: [module, security-platform, identity-and-access, theory]
---

## Zakres modułu

Tożsamość i dostęp jako pierwsza warstwa kontroli: IAM/RBAC, least privilege, MFA, federacja/SSO,
dostęp awaryjny (break-glass) i JIT. Cel: kompetencja projektowania dostępu wg zasady najmniejszych
uprawnień z audytowalnym torem awaryjnym (dowód: `ev-iam-001`).

## Koncepty i mental models

- Least privilege jako stan domyślny; uprawnienia rosną tylko z uzasadnienia.
- Tożsamość ludzka vs maszynowa (role, workload identity) — różne cykle życia.
- MFA jako warunek konieczny dla tożsamości uprzywilejowanych, w tym root.
- Break-glass: konto/rola awaryjna, audytowana, z alarmem przy użyciu.
- Federacja/SSO: jedno źródło tożsamości zamiast lokalnych użytkowników per-konto.
- Rozdział obowiązków (SoD) i przegląd dostępu (access review) jako cykl.

## Powiązane w module

- Źródła: [[resources]]
- Laby: [[labs]] (praktyka w [[03-labs]])
- Sprawdzenie: [[assessment]]
- Dowód: [[evidence]]
- Powiązany moduł: [[theory|cloud-security]]
