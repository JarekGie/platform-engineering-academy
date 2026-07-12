---
title: <nazwa projektu>
vault_type: team
domain: client-work
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-06-10
updated: 2026-06-10
tags: [project, manifest]
---

Manifest projektu. Spina cel, zakres, status i powiązania. Wczytywany przez
[[switch-project]] przy zmianie kontekstu. Domena projektu wyznacza domenę sesji.

## Objaw / problem

Po co istnieje ten projekt — cel biznesowy lub techniczny.

## Kontekst

- Domena: `<client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd>`
- Powiązane obszary: [[10-areas/<obszar>]]
- Powiązane runbooki: [[40-runbooks/<runbook>]]
- Decyzje: [[80-architecture/decision-log]]

## Działania / rozwiązanie

- Zakres i kamienie milowe.
- Status: `<aktywny | wstrzymany | zamknięty>`.
- Następny krok: <konkretna czynność>.

## Uwagi

Ryzyka, zależności, otwarte pytania. Po zamknięciu projekt archiwizuj, nie usuwaj.
