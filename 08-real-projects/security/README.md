---
title: Real Projects — Security (model i struktura)
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
tags: [real-projects, security, model, contract]
---

## Rola pliku

Definiuje **model i strukturę** przyszłych security real-projects. W Fazie 1 **nie ma tu case
studies** — wyłącznie kontrakt, według którego będą powstawać. Case studies dodajemy w Fazie 2+
(zależne od dojrzałości roadmapy i knowledge transferu).

## Kontrakt sanityzacji (twardy warunek)

Security real-projects opisują **realną pracę DC/MakoLab**, ale w Academy istnieją wyłącznie jako
**sanityzowane, portfolio-grade case studies**. Do notatek w tym vaultcie **nie wchodzą**:

- realne IP, hosty, nazwy klientów i użytkowników,
- CrowdStrike CID, klucze, tokeny, sekrety,
- allowlisty WAF, surowe wyniki skanów, dane produkcyjne.

Pełna treść pozostaje w systemach źródłowych (vault DC / prywatne repo); tutaj jest **case study
+ wskaźnik `source_ref`**.

## Domena i klasyfikacja notatek case study

Notatki security real-project (gdy powstaną) mają: `domain: internal-ops`,
`classification: confidential`, `llm_exposure: forbidden` **lub** `allowed_anonymized`
po anonimizacji. Obsługiwane w **osobnej sesji LLM** niż treść `learning`
(patrz [[DOMAIN_ISOLATION_CONTRACT]]) — nie miesza się domen w jednym kontekście.

## Model federacji evidence

Dowód końcowy projektu rejestrujemy w [[evidence-register]] jako `source_system: academy`
z `source_ref` do realnej pracy (repo/PR/URL). Career OS konsumuje po `evidence_id`, bez treści.

## Planowane projekty (Faza 2+, jeszcze nie utworzone)

`security-hardening-refresh-2026`, `crowdstrike-rollout`, `root-mfa-remediation`,
`aws-governance`, `guardduty-expansion`, `security-hub-rollout`.

## Struktura docelowa

`08-real-projects/{platform,security,ai}/` — sekcja `security/` opisana tutaj. Regrupowanie
istniejącego [[real-project]] oraz utworzenie `platform/` i `ai/` to osobna decyzja (poza Fazą 1).

## Powiązane

[[evidence-register]], [[roadmap]], `02-modules/security-platform/`.
