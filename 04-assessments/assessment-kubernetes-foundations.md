---
title: Assessment: Kubernetes Foundations
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
tags: [assessment, kubernetes]
---

## Zakres

Weryfikacja modułu [[theory|kubernetes]]: architektura, obiekty API, harmonogramowanie, sieć.

## Questions (wiedza)

1. Wyjaśnij reconcile loop i deklaratywny model stanu.
2. Różnica Service ClusterIP vs LoadBalancer vs Ingress.
3. Do czego służą requests/limits i jak wpływają na scheduling.

## Practical tasks (praktyka)

- [ ] Wdróż Deployment z 3 replikami i wystaw przez Service.
- [ ] Skonfiguruj Ingress i potwierdź dostęp z zewnątrz.
- [ ] Wymuś rolling update i zweryfikuj brak downtime.

## Passing criteria

- Wiedza: min. 2/3 pytań wyjaśnione poprawnie.
- Praktyka: wszystkie zadania praktyczne zaliczone (walidacja obserwowalna).
- Dowód: wygenerowany `ev-k8s-001` w [[evidence-register]].

## Remediation plan

Przy niezaliczeniu: wróć do [[theory]] dla luk wiedzy, powtórz [[03-labs]] dla luk praktyki,
zaplanuj ponowne podejście w [[roadmap]].
