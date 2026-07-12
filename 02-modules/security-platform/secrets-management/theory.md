---
title: Secrets Management — teoria
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
tags: [module, security-platform, secrets-management, theory]
---

## Zakres modułu

Zarządzanie sekretami przez cały cykl życia: przechowywanie, dostęp, dynamic secrets, rotacja
i unieważnianie. Narzędzia: Vault/OpenBao, AWS Secrets Manager / SSM Parameter Store.
Cel: kompetencja eliminacji sekretów statycznych na rzecz krótkożyjących poświadczeń
z rotacją (dowód: `ev-secr-001`).

## Koncepty i mental models

- Sekret statyczny to dług — cel: krótki czas życia (TTL) i rotacja.
- Dynamic secrets: poświadczenia generowane na żądanie, z leasingiem i wygaśnięciem.
- Rozdział ról: kto może czytać vs kto zarządza politykami dostępu.
- Rotacja jako proces automatyczny, nie ręczny — mierzalna i audytowalna.
- Sekret nigdy w repo, logu ani w kontekście LLM (spójne z kontraktami `_system`).

## Powiązane w module

- Źródła: [[resources]]
- Laby: [[labs]] (praktyka w [[03-labs]])
- Sprawdzenie: [[assessment]]
- Dowód: [[evidence]]
- Homelab: [[07-homelab/security/vault|vault]]
