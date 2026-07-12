---
title: Homelab — rejestr decyzji (ADR)
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
tags: [homelab, adr, decision-log]
---

Decyzje architektoniczne homelaba. Każdy wpis: `ADR-NNNN`, status, kontekst, decyzja, konsekwencje.

## Wpisy

### ADR-0001 — Platforma bazowa homelaba

- Status: Proponowana
- Kontekst: potrzebne powtarzalne, tanie środowisko treningowe do labów Kubernetes.
- Decyzja: _uzupełnij_ (np. Proxmox + VM + kubeadm; lub kind na jednej maszynie).
- Konsekwencje: wpływ na provisioning ([[homelab-architecture]]), koszt, realizm labów.
