---
title: Source pack — Kubernetes 02: Pod
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

Odcinek **Kubernetes 02 — Pod**, companion do Fundamenty **M2 „Czym jest Pod"**
([[companion-plan]]). Odbiorca: junior/mid po odcinku 01 (architektura). Źródła publiczne
(`shared-concept`) — bezpieczne do NotebookLM. Treść płatnego kursu NIE jest używana.

## Źródła zatwierdzone (publiczne, jedna domena: shared-concept)

| # | Źródło | Język | Weryfikacja | Pokrycie |
| --- | --- | --- | --- | --- |
| 1 | [Dokumentacja PL — Pod](https://kubernetes.io/pl/docs/concepts/workloads/pods/) | PL (oficjalne) | ✅ ready | czym jest Pod, Pod vs kontener, współdzielenie sieci/storage |
| 2 | [Dokumentacja EN — Pods](https://kubernetes.io/docs/concepts/workloads/pods/) | EN (kanoniczne) | ✅ ready | pełny obraz: definicja, multi-container, model sieci |
| 3 | [Pod Lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/) | EN | ✅ ready | fazy Poda, restartPolicy, stany kontenerów, probes |
| 4 | [Init Containers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) | EN | ✅ ready | kontenery init (kolejność, przygotowanie) |
| 5 | [Sidecar Containers](https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/) | EN | ✅ ready | wzorzec sidecar |
| 6 | [Configure Liveness/Readiness/Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) | EN | ✅ ready | sondy: liveness (restart), readiness, startup |

Rdzeń: **1 + 2 + 3** (Pod + lifecycle/probes); 4–6 pogłębiają init/sidecar i sondy.

## Odrzucone (hard gate)

| Kandydat | Powód |
| --- | --- |
| [[theory]] (`02-modules/kubernetes/theory.md`) | `allowed_internal_only` — nie do NotebookLM |
| Kurs kubernetespopolsku (M2, lekcje/laby) | płatny/licencja — prywatny tor, tylko publiczny spis tematów jako szkielet |

## NotebookLM — wygenerowano (2026-07-12)

| Element | Wartość |
| --- | --- |
| Notebook ID | `bde19dc5-231b-4800-87f0-3cbde2bb9c6f` |
| Źródła (ready) | 250570f1 (PL Pod), 75b9335d (Pods), 30c56546 (Lifecycle), 3b08263a (Init), 509fdfb5 (Sidecar), 1d6fe412 (Probes) |
| Audio task/artifact ID | `e0742d6d-815c-40e4-83a5-8063029a6f9e` → `kubernetes-02-pod.mp3` |

Quiz/flashcards NIE tutaj (sam podcast) — powstają w [[academy-learning-loop]] po odsłuchu.

## Powiązane
[[podcast-brief]], [[glossary]], [[questions-for-hosts]], [[companion-plan]], [[NOTEBOOKLM_CONTRACT]].
