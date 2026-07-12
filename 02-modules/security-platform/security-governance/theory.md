---
title: Security Governance — teoria
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
tags: [module, security-platform, security-governance, theory]
---

## Zakres modułu

Governance bezpieczeństwa jako kod: guardrails egzekwowane automatycznie, mapowanie kontroli
na wymagania i produkowanie audytowalnego dowodu kontroli (evidence-of-control). Cel: kompetencja
utrzymania guardrails jako kodu z ciągłym dowodem zgodności (dowód: `ev-gov-001`).

## Koncepty i mental models

- Guardrail jako kod: polityka wersjonowana i wdrażana przez IaC, nie klikana ręcznie.
- Prewencja vs detekcja: SCP/OPA (blokuje) kontra Config rules (wykrywa dryf).
- Control mapping: wymaganie → kontrola → dowód, jako spójny łańcuch.
- Evidence-of-control: kontrola bez dowodu jej działania jest niekompletna.
- Rozdział: governance definiuje granicę, zespoły działają w jej ramach.

## Powiązane w module

- Źródła: [[resources]]
- Laby: [[labs]] (praktyka w [[03-labs]])
- Sprawdzenie: [[assessment]]
- Dowód: [[evidence]]
- Powiązane moduły: [[theory|cloud-security]], [[theory|identity-and-access]]
