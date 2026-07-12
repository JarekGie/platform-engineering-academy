---
title: Incydent — restart zadań ECS przez OOM na UAT
vault_type: team
domain: aiops
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-06-10
updated: 2026-06-10
tags: [incident, rca, aiops]
---

Przykładowa, wypełniona notatka incydentu z domeny `aiops`, utworzona przez [[incident-note]].
Pokazuje strukturę runbooka i domknięte pola RCA.

## Objaw / problem

2026-06-10 ok. 14:10 zadania ECS usługi API na UAT restartowały się cyklicznie. p95 czasu
odpowiedzi wzrosło z ~180 ms do ~2,5 s. Wpływ: degradacja UAT przez ~40 minut, brak wpływu na prod.

## Kontekst

- Środowisko: uat
- Powiązane runbooki: [[40-runbooks/ecs-task-restart]]
- Powiązany projekt: [[20-projects/maspex-uat-loadtest]]
- Wykrycie: alarm CloudWatch (liczba restartów zadań > 0 w 5 min)

## Działania / rozwiązanie

- Tymczasowo podniesiono limit pamięci zadania z 512 MB do 1024 MB.
- Zrestartowano serwis ECS wg [[40-runbooks/ecs-task-restart]].
- Stan końcowy: przywrócono; p95 wróciło do ~190 ms.

## Uwagi

**Timeline**
- 14:10 — pierwszy alarm CloudWatch o restartach zadań
- 14:18 — potwierdzenie OOM w logach kontenera
- 14:32 — podniesiony limit pamięci, redeploy serwisu
- 14:50 — metryki ustabilizowane, incydent zamknięty

**Root cause**
Limit pamięci zadania (512 MB) zbyt niski dla profilu obciążenia load testu UAT —
przy szczycie ruchu kontener przekraczał limit i był ubijany (OOM).

**Follow-up actions**
- [x] Podnieść limit pamięci w definicji zadania — właściciel: jgolab — termin: 2026-06-10
- [ ] Dodać alarm CloudWatch na zużycie pamięci > 80% — właściciel: jgolab — termin: 2026-06-13
- [ ] Zweryfikować próg alarmu p95 dla UAT — właściciel: zespół DC — termin: 2026-06-16
