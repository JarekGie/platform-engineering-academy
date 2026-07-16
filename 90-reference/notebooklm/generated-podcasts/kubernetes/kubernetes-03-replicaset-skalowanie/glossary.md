---
title: Glossary — Kubernetes 03: ReplicaSet i skalowanie
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-07-13
updated: 2026-07-13
tags: [podcast, glossary, notebooklm, kubernetes]
---

## Słownik pojęć

Terminy w oryginale; definicje po polsku.

| Pojęcie | Definicja (1–2 zdania) |
| --- | --- |
| ReplicaSet | Controller utrzymujący zadaną liczbę identycznych Podów; odtwarza je po awarii. |
| replicas | Pole określające pożądaną liczbę Podów w controllerze. |
| Horizontal scaling | Skalowanie „w szerz" — więcej instancji (Podów). Preferowane w Kubernetes. |
| Vertical scaling | Skalowanie „w górę" — więcej CPU/pamięci dla istniejącej instancji. |
| Label | Para klucz-wartość przypięta do obiektu; służy do selekcji i grupowania. |
| Selector | Reguła (np. `matchLabels`) wybierająca obiekty po etykietach — tak ReplicaSet znajduje swoje Pody. |
| Annotation | Metadane klucz-wartość do celów opisowych/narzędziowych; NIE służą do selekcji. |
| Desired state | Stan pożądany zadeklarowany w manifeście; controller dąży do jego utrzymania (reconcile loop). |
| `kubectl scale` | Komenda zmieniająca liczbę replik controllera (np. `--replicas=3`). |
| Cluster scaling | Skalowanie samego klastra — dodawanie/odejmowanie nodes, gdy Podom brakuje miejsca. |

## Powiązane
[[source-pack]], [[podcast-brief]].
