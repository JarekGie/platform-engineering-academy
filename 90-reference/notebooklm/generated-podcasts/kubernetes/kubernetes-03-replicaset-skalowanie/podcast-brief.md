---
title: Podcast brief — Kubernetes 03: ReplicaSet i skalowanie
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
tags: [podcast, brief, notebooklm, kubernetes]
---

## Reguła językowa (WAŻNE dla hostów)

Po polsku, terminy w oryginale: ReplicaSet, Pod, label, selector, annotation, `replicas`,
`kubectl scale`, horizontal scaling, vertical scaling, desired state, matchLabels.

## Temat i cel odcinka

**Teza 1:** Skalowanie horyzontalne (więcej Podów) to domena Kubernetes; **ReplicaSet** utrzymuje
zadaną liczbę replik i odtwarza Pody po awarii.
**Teza 2:** **Labels + selectors** to klej, którym controllery (ReplicaSet, Service) odnajdują
swoje Pody; annotations to metadane, których się NIE selekcjonuje.

Po odcinku słuchacz rozróżnia horizontal vs vertical scaling, rozumie działanie ReplicaSet i rolę
etykiet/selektorów.

## Odbiorca

Poziom **1 Junior → 2 Mid**, filar Kubernetes. Po odc. 01 (architektura) i 02 (Pod).

## Struktura (ok. 12–18 min)

1. **Skalowanie: horizontal vs vertical (3 min):** więcej instancji vs większe zasoby; dlaczego
   K8s stawia na horizontal.
2. **Labels i annotations (3 min):** etykiety = klucz-wartość do selekcji; selektory (matchLabels);
   annotations = metadane opisowe (nie do selekcji). Przykłady.
3. **ReplicaSet (4 min):** utrzymanie `desired state` (liczba replik) przez selector; odtwarzanie
   Podów po awarii; reconcile loop w akcji (nawiązanie do odc. 01).
4. **Skalowanie z ReplicaSet (3 min):** `kubectl scale`, zmiana `replicas`; co się dzieje z Podami.
5. **Skalowanie klastra (2 min):** krótko — więcej nodes, gdy Pody nie mają się gdzie zmieścić.
6. **Domknięcie (2 min):** w praktyce ReplicaSet tworzy się przez **Deployment**, nie wprost —
   zapowiedź modułu Deployment. Lab: `kubectl scale` na klastrze z odc. 01.

## Czego NIE poruszać

- Deployment (osobny moduł), HPA/autoscaling (PRO), StatefulSet.
- Żadnych danych produkcyjnych/klientów/sekretów (hard gate).

## Powiązane
[[source-pack]], [[glossary]], [[questions-for-hosts]].
