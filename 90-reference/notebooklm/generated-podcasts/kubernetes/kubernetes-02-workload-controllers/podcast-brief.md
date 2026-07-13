---
title: Podcast brief — Kubernetes 02: workload controllers
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

Podcast po polsku, ale **nazw technicznych, poleceń i zwrotów NIE tłumaczymy** — w oryginale:
Deployment, StatefulSet, DaemonSet, ReplicaSet, Pod, workload, rolling update, rollback,
PersistentVolumeClaim (PVC), headless Service, `kubectl scale`, `kubectl rollout`.

## Temat i cel odcinka

**Teza 1:** Nie zarządzasz Podami ręcznie — robi to **controller**, który utrzymuje stan pożądany.
Wybór kontrolera zależy od natury aplikacji.
**Teza 2:** **Deployment** = aplikacje bezstanowe (Pody wymienne); **StatefulSet** = stanowe
(stała tożsamość, kolejność, własny PVC); **DaemonSet** = jeden Pod na każdym node (agenty).

Po odcinku słuchacz **rozróżnia Deployment vs StatefulSet vs DaemonSet i wie, kiedy którego użyć**
(domyka lukę z assessmentu).

## Odbiorca

Poziom **1 Junior → 2 Mid**, filar Kubernetes. Po odcinku 01 (architektura, reconcile loop).

## Struktura (ok. 12–18 min, pod sesję 25 min)

1. **Wprowadzenie (2–3 min):** po co kontrolery — Pod sam nie wraca po awarii; controller pilnuje
   stanu pożądanego (nawiązanie do reconcile loop z odc. 01). Wspomnij ReplicaSet jako fundament.
2. **Deployment (3–4 min):** aplikacje bezstanowe, ReplicaSet pod spodem, rolling update i rollback,
   `kubectl scale`. Pody wymienne, losowe nazwy, współdzielony/efemeryczny storage.
3. **StatefulSet (3–4 min):** aplikacje stanowe (bazy, kolejki). Stabilna tożsamość (`app-0`, `app-1`),
   uporządkowane tworzenie/skalowanie, **PVC per Pod**, headless Service. Dlaczego baza ≠ Deployment.
4. **DaemonSet (2–3 min):** jeden Pod na każdym node; agenty logów/monitoringu (np. Fluentd),
   komponenty sieciowe. Automatyczny Pod na nowym node.
5. **Domknięcie (2–3 min):** tabela decyzyjna „jaka aplikacja → jaki controller"; krótka wzmianka
   Job/CronJob jako zadania jednorazowe/cykliczne. Zapowiedź: Lab — deploy na klastrze z odc. 01.

## Czego NIE poruszać

- Głęboka sieć (CNI), Ingress, storage classes — poza zakresem.
- Żadnych danych produkcyjnych, klientów, hostów, sekretów (hard gate).
- HPA/autoscaling — osobny, późniejszy temat.

## Powiązane
[[source-pack]], [[glossary]], [[questions-for-hosts]].
