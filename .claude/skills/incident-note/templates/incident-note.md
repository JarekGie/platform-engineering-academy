---
title: Incydent — <krótki temat>
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
tags: [incident, rca]
---

Notatka incydentu wg wzorca runbooka. Tworzona przez [[incident-note]] (patrz [[AGENTS]]).
Domena: `aiops` lub `internal-ops`. Jeśli wchodzą dane klienta/osobowe — podnieś
`classification` na `confidential` i ustaw `compliance_review: required`.

## Objaw / problem

<co się stało, kiedy (czas), jaki wpływ na usługę/użytkowników>

## Kontekst

- Środowisko: <prod | uat | ...>
- Powiązane runbooki: [[40-runbooks/<runbook>]]
- Powiązany projekt: [[20-projects/<projekt>]]
- Wykrycie: <alert / zgłoszenie / monitoring>

## Działania / rozwiązanie

- <krok mitygacji>
- <krok naprawczy>
- Stan końcowy: <przywrócono | obejście | otwarte>

## Uwagi

**Timeline**
- <HH:MM> — <zdarzenie>
- <HH:MM> — <zdarzenie>

**Root cause**
<przyczyna źródłowa; jeśli nieustalona — napisz wprost, że jest otwarta>

**Follow-up actions**
- [ ] <działanie> — właściciel: <kto> — termin: <YYYY-MM-DD>
- [ ] <działanie> — właściciel: <kto> — termin: <YYYY-MM-DD>
