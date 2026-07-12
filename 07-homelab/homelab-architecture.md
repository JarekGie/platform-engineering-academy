---
title: Homelab — architektura
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
tags: [homelab, architecture, infra]
---

## Cel homelaba

Środowisko treningowe do wykonywania labów (np. klaster Kubernetes, sieć, storage).
Homelab jest źródłem dowodów praktycznych ([[evidence-register]]).

## Architektura

Opis warstw: hardware / hypervisor / platforma (np. Proxmox → VM → k8s). Dodaj diagram (Mermaid/obraz).

```
[hosty] -> [hypervisor] -> [VM/nodes] -> [platforma: k8s] -> [workloady labow]
```

## Adresacja

| Segment | Zakres | Przeznaczenie |
| --- | --- | --- |
| mgmt | _np. 10.0.10.0/24_ | zarządzanie |
| lab | _np. 10.0.20.0/24_ | workloady labów |

## Platforma i provisioning

- Provisioning: IaC (np. Terraform/Ansible) — wskaż repo w `source_ref`.
- Platforma: co uruchamia workloady (k8s, dystrybucja, wersja).

## Eksperymenty

Rejestr eksperymentów homelab (co testowano, wynik, wnioski) — powiązania do [[03-labs]].
