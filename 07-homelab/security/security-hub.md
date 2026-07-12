---
title: Homelab Security — Security Hub
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
tags: [homelab, security, security-hub, aws]
---

## Rola pliku

Warstwa agregacji findingów i standardów w koncie lab. Spina detekcję ([[guardduty]]) z kontrolami
i mapowaniem — środowisko dla modułu [[theory|security-governance]].

## Konfiguracja w homelabie

- Security Hub włączony w koncie lab, agreguje findingi (m.in. z GuardDuty).
- Włączone standardy/kontrole (np. CIS AWS Foundations) jako baza mapowania.
- Widok zgodności: które kontrole `passed`, które `failed`.

## Ćwiczenia

- Zmapuj finding GuardDuty na kontrolę i wymaganie (łańcuch: wymaganie → kontrola → dowód).
- Zbuduj mini-raport zgodności jako punkt wyjścia do `ev-gov-002`.

## Granica bezpieczeństwa

Wyłącznie dane konta lab. Standardy i wyniki nie zawierają danych produkcyjnych ani klientowskich.

## Powiązane

[[threat-model]], [[guardduty]], [[theory|security-governance]].
