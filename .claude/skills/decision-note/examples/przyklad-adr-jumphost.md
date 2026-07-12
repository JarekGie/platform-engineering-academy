---
title: Log decyzji architektonicznych (ADR)
vault_type: team
domain: internal-ops
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-06-10
updated: 2026-06-10
tags: [architecture, adr, decision-log]
---

Przykładowy fragment `80-architecture/decision-log.md` z dwoma ADR. Pokazuje format wpisu
dopisywanego przez [[decision-note]] oraz ciągłą numerację.

## Decyzje

### ADR-0007 — Dostęp do DocumentDB przez jumphost ECS Fargate
- Status: zaakceptowana
- Data: 2026-06-05

**Kontekst** — DocumentDB w prywatnej podsieci nie jest osiągalny spoza VPC. Zespół DC
potrzebuje doraźnego dostępu diagnostycznego bez wystawiania bazy publicznie. Powiązanie:
[[20-projects/puzzler-b2b]], runbook [[40-runbooks/db-jumphost]].

**Decyzja** — Stawiamy tymczasowy jumphost jako zadanie ECS Fargate w tej samej VPC,
z dostępem SSH przez tunel i rotowanym kluczem. Jumphost uruchamiany na żądanie, nie stały.

**Konsekwencje** — (+) brak publicznej ekspozycji bazy, koszt tylko podczas użycia.
(−) dodatkowy krok wiring w Terraformie i procedura rotacji klucza SSH do utrzymania.

### ADR-0008 — Limit pamięci zadań ECS API na UAT podniesiony do 1024 MB
- Status: zaakceptowana
- Data: 2026-06-10

**Kontekst** — Przy load testach UAT zadania API przekraczały limit 512 MB i były ubijane
(OOM). Powiązanie: incydent [[40-runbooks/incidents/2026-06-10-restart-zadan-ecs-oom]].

**Decyzja** — Podnosimy limit pamięci zadania API na UAT do 1024 MB i dodajemy alarm
CloudWatch na zużycie pamięci > 80%.

**Konsekwencje** — (+) stabilność pod obciążeniem testowym, wcześniejsze ostrzeganie.
(−) wyższy koszt zadania na UAT; próg p95 wymaga ponownej kalibracji.
