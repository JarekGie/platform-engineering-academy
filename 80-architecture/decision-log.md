---
title: Rejestr decyzji academy (ADR)
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
tags: [architecture, adr, decision-log]
---

Chronologiczny rejestr decyzji dotyczących academy (ADR). Skill [[decision-note]] dopisuje nowe wpisy
na końcu w jednolitym formacie. Każdy wpis ma numer `ADR-NNNN`, status i uzasadnienie.
Nie usuwaj wpisów — decyzje wycofane oznacz statusem.

## Wpisy

### ADR-0001 — Prowadzić naukę jak pipeline kompetencji (evidence-first)

- Status: Zaakceptowana
- Kontekst: Nauka bywa konsumpcją materiału bez dowodu kompetencji; brakuje powtarzalnej drogi
  od teorii do dowodu i do rzeczywistego projektu.
- Decyzja: Prowadzić academy jako pipeline `Roadmap → Theory → Lab → Assessment → Homelab → Evidence
  → Real Project`, gdzie każdy moduł produkuje dowód ([[evidence-register]]).
- Konsekwencje: Kompetencje mają twarde pokrycie; Career OS może konsumować evidence przez federację
  (`source_system: academy`); homelab (trening) rozdzielony od real projects (rzeczywisty dowód).
