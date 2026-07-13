---
title: Source pack — Kubernetes 02: workload controllers (Deployment vs StatefulSet vs DaemonSet)
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-07-12
updated: 2026-07-12
tags: [podcast, source-pack, notebooklm, kubernetes]
---

## Kontekst

Source-pack dla odcinka **Kubernetes 02 — workload controllers**. Pre-generowany przez krok 9
skilla [[end-day]] jako następny temat z [[academy-state]] (`next_action`). Odbiorca: junior/mid,
po odcinku 01 (architektura). Celuje wprost w lukę z [[assessment-baseline]]: **Deployment vs StatefulSet**.

Źródła publiczne (`shared-concept`) — bezpieczne do NotebookLM. Wskaźniki (URL), nie treść.

## Źródła zatwierdzone (publiczne, jedna domena: shared-concept)

| # | Źródło | Język | Dostęp | Weryfikacja | Pokrycie |
| --- | --- | --- | --- | --- | --- |
| 1 | [Oficjalna dokumentacja PL — Zasoby obliczeniowe (Workloads)](https://kubernetes.io/pl/docs/concepts/workloads/) | PL (oficjalne) | darmowy | ✅ zweryfikowane | wprowadzenie: workload, Pod, po co kontrolery |
| 2 | [Oficjalna dokumentacja — Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) | EN (kanoniczne) | darmowy | ✅ oficjalne | ReplicaSet, rolling update, rollback, skalowanie (aplikacje bezstanowe) |
| 3 | [Oficjalna dokumentacja — StatefulSet](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/) | EN (kanoniczne) | darmowy | ✅ oficjalne | stabilna tożsamość, kolejność, PVC per Pod (aplikacje stanowe) |
| 4 | [Oficjalna dokumentacja — DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) | EN (kanoniczne) | darmowy | ✅ oficjalne | Pod na każdym node (agenty logów/monitoringu) |
| 5 | [lsdev.pl — Kubernetes krok po kroku](https://lsdev.pl/posts/kubernetes-krok-po-kroku/) | PL | darmowy | ⚠️ z wyszukiwania — zweryfikuj przy dodawaniu | praktyczne wprowadzenie, Deployment/Service |
| 6 | [pgmys.edu.pl — pierwsze wdrożenie i skalowanie](https://pgmys.edu.pl/kubernetes-pierwsze-wdrozenie) | PL | darmowy | ⚠️ z wyszukiwania — zweryfikuj przy dodawaniu | Deployment + ReplicaSet, skalowanie |

**Rekomendacja rdzenia (najwyższe pokrycie):** źródła **1 + 2 + 3 + 4** — PL wprowadzenie +
komplet kanonicznych stron trzech kontrolerów. NotebookLM wygeneruje audio po polsku niezależnie
od języka źródła.

## Odrzucone (hard gate — i dlaczego)

| Kandydat | Powód |
| --- | --- |
| [[theory]] (`02-modules/kubernetes/theory.md`) | `allowed_internal_only` — nie eksportujemy do NotebookLM |
| Kurs kubernetespopolsku.pl | płatny/licencja — nie do NotebookLM (patrz odcinek 01) |

## NotebookLM — wygenerowano (2026-07-12, pre-generacja krok 9 end-day)

| Element | Wartość |
| --- | --- |
| Notebook ID | `09fd2f1b-ca9d-496d-8b85-830ae6b38580` |
| Źródło 1 (Workloads, PL) | `9e055850-27fd-484d-8a75-470652629903` — ready |
| Źródło 2 (Deployments, EN) | `4d80d6df-c64e-41ee-bcd9-5d109ee0aee8` — ready |
| Źródło 3 (StatefulSets, EN) | `488defa6-e17b-452b-b3d4-a6cb27723f4f` — ready |
| Źródło 4 (DaemonSet, EN) | `80efc2dc-ed15-4ddc-beaa-239fc2006228` — ready |
| Audio task/artifact ID | `1d8b14e3-1754-46ca-a6a7-d3b1ff3764e8` → `kubernetes-02-workload-controllers.mp3` |

Quiz/flashcards świadomie NIE generowane tutaj (krok 9 = sam podcast; powstają w [[academy-learning-loop]] po odsłuchu).

## Powiązane
[[podcast-brief]], [[glossary]], [[questions-for-hosts]], [[NOTEBOOKLM_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]].
