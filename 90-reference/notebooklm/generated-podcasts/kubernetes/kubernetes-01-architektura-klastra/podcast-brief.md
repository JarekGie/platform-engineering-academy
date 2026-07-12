---
title: Podcast brief — Kubernetes 01: architektura klastra
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

Podcast prowadzony **po polsku**, ale **nazw technicznych, poleceń i zwrotów branżowych NIE
tłumaczymy**. Zostają w oryginale: control plane, worker node, Pod, kubelet, kube-apiserver,
etcd, kube-scheduler, kube-controller-manager, kube-proxy, container runtime, reconcile loop,
`kubectl`, `kubectl get nodes`. Narracja i wyjaśnienia po polsku, terminologia po angielsku.

## Temat i cel odcinka

**Teza 1:** Kubernetes rozdziela klaster na **control plane** (mózg — podejmuje decyzje) i
**worker nodes** (mięśnie — uruchamiają aplikacje w Podach).
**Teza 2:** Kubernetes działa w modelu **deklaratywnym**: opisujesz stan pożądany, a
**reconcile loop** nieustannie dąży, by stan faktyczny go dogonił.

Po odcinku słuchacz potrafi wymienić komponenty control plane i node oraz wyjaśnić, po co
jest każdy z nich.

## Odbiorca

Poziom **1 Junior → 2 Mid**, filar **Kubernetes**. Słuchacz zna Docker (laby) i AWS/Terraform
z praktyki, ale fundament K8s ma kruchy (nie zna różnicy Deployment vs StatefulSet — to kolejny odcinek).

## Struktura (ok. 12–18 min, pod sesję 25 min)

1. **Wprowadzenie / problem (2–3 min):** dlaczego samo uruchamianie kontenerów nie wystarcza w
   skali — kto pilnuje, że kontener żyje, gdzie ma działać, jak go znaleźć w sieci. Analogia do
   orkiestry: dyrygent (control plane) i muzycy (nodes).
2. **Rdzeń — control plane (4–6 min):** kube-apiserver (brama, jedyny punkt zapisu stanu),
   etcd (magazyn stanu, key-value), kube-scheduler (gdzie umieścić Pod), kube-controller-manager
   (pętle kontrolne), cloud-controller-manager (integracja z chmurą). Podkreśl **reconcile loop**.
3. **Rdzeń — worker node (4–6 min):** kubelet (agent, dba o Pody na węźle), kube-proxy (reguły
   sieciowe / Service), container runtime (containerd/CRI-O — faktyczne uruchamianie kontenerów).
4. **Domknięcie (2–3 min):** jak to złożyć w głowie (deklaratywny model), i zapowiedź kroku
   praktycznego: Theory → Lab (postawienie klastra kind/minikube, `kubectl get nodes`) → Evidence `ev-k8s-001`.

## Czego NIE poruszać

- Deployment/StatefulSet/DaemonSet i workload controllers — to następny odcinek (nie mieszać).
- Żadnych danych produkcyjnych, nazw klientów, hostów, sekretów, identyfikatorów kont (hard gate).
- Zaawansowana sieć (CNI), storage (CSI), RBAC — poza zakresem odcinka 01.

## Powiązane
[[source-pack]], [[glossary]], [[questions-for-hosts]].
