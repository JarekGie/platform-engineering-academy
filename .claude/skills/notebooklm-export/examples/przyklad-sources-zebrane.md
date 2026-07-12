---
title: Źródła NotebookLM (rejestr)
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
tags: [notebooklm, sources]
---

Przykładowy, zebrany rejestr `90-reference/notebooklm/sources.md` po uruchomieniu
[[notebooklm-export]]. Pokazuje wciągnięte `approved` oraz pominięte kandydaty.

## Zatwierdzone źródła

```yaml
- source_id: src-rotacja-kluczy-ssh
  title: Rotacja kluczy SSH do jumphosta
  origin_note: "[[40-runbooks/rotacja-kluczy-ssh]]"
  notebooklm_source: approved
  approved_by: "DC Team / Compliance"
  approved_date: 2026-06-10
  classification: internal
  llm_exposure: allowed_internal_only
  notes: Zatwierdzone po usunięciu nazw hostów. Tylko narzędzia wewnętrzne.

- source_id: src-standard-onboardingu
  title: Standard onboardingu inżyniera DC
  origin_note: "[[30-standards/onboarding-standard]]"
  notebooklm_source: approved
  approved_by: "Owner standardu"
  approved_date: 2026-06-09
  classification: internal
  llm_exposure: allowed
  notes: Bez danych klientowskich. Gotowe jako źródło NotebookLM.
```

## Raport skilla (wypisany operatorowi)

```
Rejestr sources.md: 2 źródła approved
Pominięte kandydaty: 3
  - 20-projects/maspex-uat-loadtest — notebooklm_source: candidate (czeka na approve)
  - 40-runbooks/ecs-task-restart — brak approved_by/approved_date (nie jest realnie zatwierdzone)
  - 20-projects/klient-a-migracja — classification: confidential bez compliance approve
Domena: internal-ops (spójna)
```
