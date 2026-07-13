---
title: Podcast brief — Kubernetes 02: Pod
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
tags: [podcast, brief, notebooklm, kubernetes]
---

## Reguła językowa (WAŻNE dla hostów)

Po polsku, ale **nazwy techniczne i polecenia w oryginale**: Pod, container, init container,
sidecar, `restartPolicy`, liveness probe, readiness probe, startup probe, `kubectl exec`,
`kubectl port-forward`, `kubectl logs`, namespace, manifest (YAML).

## Temat i cel odcinka

**Teza 1:** Pod, nie container, jest najmniejszą jednostką w Kubernetes — to „apartament" dla
jednego lub kilku kontenerów, które **dzielą sieć (to samo IP/localhost) i storage**.
**Teza 2:** Pody są efemeryczne i same nie wracają po awarii — o restart kontenera dba
`restartPolicy` + **liveness probe**; o gotowość do ruchu — **readiness probe**.

Po odcinku słuchacz umie zdefiniować Pod, rozumie różnicę Pod vs kontener vs serwer oraz wie,
po co init/sidecar i trzy rodzaje sond.

## Odbiorca

Poziom **1 Junior → 2 Mid**, filar Kubernetes. Po odcinku 01. Zna Dockera (kontenery) z labów.

## Struktura (ok. 12–18 min, pod sesję 25 min)

1. **Wprowadzenie (2 min):** dlaczego Pod, skoro znasz kontenery? Analogia „apartamentu" —
   kontenery w Podzie współdzielą sieć i wolumeny, komunikują się przez `localhost`.
2. **Pod vs kontener vs serwer (3 min):** Pod grupuje kontenery; efemeryczny (nie „pet"),
   dostaje własne IP w klastrze; czym różni się od tradycyjnego serwera.
3. **Definicja Poda (3 min):** manifest YAML (apiVersion/kind/metadata/spec), obraz, port;
   `kubectl apply`, `kubectl get/describe pod`, `kubectl logs`, `kubectl exec`, `port-forward`.
4. **init i sidecar (3 min):** init container (uruchamia się przed, w kolejności, do przygotowania);
   sidecar (towarzyszy głównemu kontenerowi — np. proxy, agent logów).
5. **Utrzymanie przy życiu (3 min):** `restartPolicy`; **liveness probe** (restart, gdy zawiśnie),
   **readiness probe** (nie kieruj ruchu, póki niegotowy), **startup probe** (wolny start).
6. **Domknięcie (2 min):** Pod to fundament — kolejne obiekty (ReplicaSet, Deployment) zarządzają
   Podami. Zapowiedź: M3 skalowanie (ReplicaSet). Lab: uruchom Pod na klastrze z odc. 01, sonda liveness.

## Czego NIE poruszać

- Deployment/ReplicaSet/StatefulSet — kolejne moduły (nie mieszać).
- Sieć klastra (CNI), Service — później (M6).
- Żadnych danych produkcyjnych, klientów, hostów, sekretów (hard gate).

## Powiązane
[[source-pack]], [[glossary]], [[questions-for-hosts]].
