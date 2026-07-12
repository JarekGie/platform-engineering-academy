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

Rejestr zatwierdzonych źródeł NotebookLM. Odświeżany przez [[notebooklm-export]].
Wchodzą TYLKO notatki z `notebooklm_source: approved` (patrz [[NOTEBOOKLM_CONTRACT]]).
NotebookLM NIE jest source of truth — prawda zostaje w notatkach `origin_note`.

## Zatwierdzone źródła

Każdy wpis odpowiada polom `schemas/notebooklm-source.schema.yaml`:

```yaml
- source_id: <src-temat-w-kebab-case>
  title: <tytuł źródła>
  origin_note: "[[<ścieżka/notatka>]]"
  notebooklm_source: approved
  approved_by: "<osoba/rola, np. DC Team / Compliance>"
  approved_date: <YYYY-MM-DD>
  classification: <public | internal | confidential | restricted>
  llm_exposure: <allowed | allowed_anonymized | allowed_internal_only>
  notes: <zakres anonimizacji / warunki przeglądu / powód>
```
