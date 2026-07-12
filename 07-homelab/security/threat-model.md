---
title: Homelab Security — model zagrożeń
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
tags: [homelab, security, threat-model]
---

## Rola pliku

Punkt wejścia sekcji `07-homelab/security/`. Definiuje model zagrożeń homelaba, do którego
odnoszą się pozostałe pliki (detekcja, sekrety, kontrole). Bez tego modelu detekcja i kontrole
nie mają układu odniesienia — najpierw ustalamy, co i przed czym chronimy.

## Aktywa

Co chronimy w homelabie treningowym (nie produkcja): konto/tenant lab, workloady labów,
sekrety treningowe w [[vault]], dane telemetryczne detekcji.

## Aktorzy i granice zaufania

- Aktor zewnętrzny (internet → ekspozycja usług lab).
- Aktor wewnętrzny (skompromitowany workload w klastrze).
- Granica: konto lab jest odizolowane od kont produkcyjnych i danych klientowskich.

## Powierzchnia ataku

Ekspozycja API/usług, tożsamość i uprawnienia (odniesienie do [[theory|identity-and-access]]),
sekrety, ruch sieciowy.

## Mapowanie na detekcję

Zagrożenia z tego modelu powinny mieć pokrycie w detekcji: [[guardduty]] (detekcja zdarzeń),
[[security-hub]] (agregacja i kontrole). Pełna mapa pokrycia (`detection-map.md`) powstanie
w Fazie 2 wraz z modułem detection-engineering.

## Powiązane

[[07-homelab/homelab-architecture|homelab-architecture]], [[guardduty]], [[security-hub]], [[vault]].
