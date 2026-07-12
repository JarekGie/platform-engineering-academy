---
title: Homelab Security — GuardDuty
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
tags: [homelab, security, guardduty, aws]
---

## Rola pliku

Środowisko treningowe detekcji zdarzeń w koncie lab. Jest źródłem dowodów praktycznych dla modułu
[[theory|cloud-security]] (`ev-csec-001`) — tu włączamy GuardDuty, generujemy i triażujemy findingi.

## Konfiguracja w homelabie

- GuardDuty włączony w koncie lab (nie produkcja).
- Źródła findingów: logi VPC Flow, DNS, CloudTrail (w zakresie konta lab).
- Findingi generowane w sposób kontrolowany (scenariusze treningowe), nie na realnym ruchu klientów.

## Ćwiczenia

- Wygeneruj finding treningowy, przejdź pełny triage: severity → kontekst → decyzja.
- Powiąż finding z modelem z [[threat-model]] i agregacją w [[security-hub]].

## Granica bezpieczeństwa

Wszystkie dane pochodzą z konta lab. Żadne realne IP/hosty/dane klientów nie trafiają tutaj
ani do dowodów. Adresacja zgodna ze schematem homelaba ([[07-homelab/homelab-architecture|homelab-architecture]]).

## Powiązane

[[threat-model]], [[security-hub]], [[theory|cloud-security]].
