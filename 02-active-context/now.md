---
title: Bieżący kontekst nauki (now)
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-16
tags: [active-context, now]
---

Ta notatka opisuje JEDEN aktualny kontekst pracy nad kompetencją. Aktualizowana przez skille
[[start-day]], [[end-day]], [[switch-project]] — nie edytuj ręcznie w trakcie sesji,
jeśli korzystasz z tych skilli. Trzymaj jedną domenę wrażliwości na sesję.

## Aktywny moduł / krok pipeline

Moduł `02-modules/kubernetes/`, krok pipeline: **Theory** (po podcaście 01 „architektura
klastra"). Cel: Kubernetes 1 → 2 w etapie 90 dni ([[adaptive-roadmap]]).

## Aktywna domena (jedna sesja = jedna domena)

`learning`. Jedna sesja LLM = jedna domena wrażliwości. Materiał niewrażliwy
(`shared-concept`) może współwystępować z `learning` (patrz [[DOMAIN_ISOLATION_CONTRACT]]).

## Bieżący kontekst

Gotowy pakiet do nauki K8s 01: audio (NotebookLM), quiz i flashcards
(`90-reference/notebooklm/generated-podcasts/kubernetes/kubernetes-01-architektura-klastra/`).
Zaplanowany dowód: `ev-k8s-001` po labie kind/minikube.

## Następny krok

Odsłuchać podcast K8s 01, przerobić flashcards + quiz, wnioski własnymi słowami zapisać do
`02-modules/kubernetes/theory.md`. Potem odcinek 02 (Deployment vs StatefulSet).

> Uwaga (2026-07-16): sesja frameworkowa (domena `shared-concept`) — vault dostał strukturę na
> uruchamialny kod labów (monorepo): standardy `30-standards/lab-*`, szablony, `bin/validate-vault.sh`,
> CI (`.github/workflows/`), szkielet `03-labs/aws-eks-foundation/` (bez kodu). Kontekst nauki K8s
> bez zmian. Otwarte: ADR-0002 (public vs internal) i inwentaryzacja notatek `internal`.
