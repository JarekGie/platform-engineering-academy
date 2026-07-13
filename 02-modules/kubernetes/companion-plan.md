---
title: Kubernetes — plan companion do kursu kubernetespopolsku
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
tags: [module, kubernetes, roadmap, companion]
---

## Cel

Academy działa jako **companion** do płatnego kursu `kubernetespopolsku` (Fundamenty + PRO),
który operator realizuje równolegle. Kolejność nauki = **kolejność modułów kursu**.

**Granica licencyjna:** wykorzystujemy jedynie **publiczny spis tematów** kursu jako szkielet
programowy. Treść lekcji/wideo/labów kursu jest płatna i **nie trafia** do NotebookLM ani do notatek
— to prywatny tor nauki operatora. Odcinki podcastów Academy budujemy WYŁĄCZNIE z publicznych
źródeł (dokumentacja PL/EN, otwarte blogi) przez [[academy-podcasts]].

## Model pętli per moduł

Dla każdego modułu kursu: 🎧 podcast Academy (PL, pre-listen) → 📚 lekcje/laby kursu (osobno)
→ 🧪 lab Academy na własnym klastrze [[lab-minikube-qemu-klaster]] → 📝 quiz/flashcards
([[academy-learning-loop]]) → 🎯 evidence. Podcast pre-generuje krok 9 [[end-day]].

## Fundamenty — mapowanie

| Kurs (moduł) | Odcinek Academy | Publiczne źródła (docs) | Status |
| --- | --- | --- | --- |
| M1 Czym jest / architektura | `kubernetes-01-architektura-klastra` | Components (PL), Cluster Architecture | ✅ audio + quiz + flashcards; lab `ev-k8s-001` |
| **M2 Czym jest Pod** | **`kubernetes-02-pod`** ← NASTĘPNY | Pods, Pod Lifecycle, init/sidecar containers, liveness/readiness | 🔜 do wygenerowania |
| M3 Skalowanie (ReplicaSet, etykiety) | `kubernetes-03-replicaset-skalowanie` | ReplicaSet, Labels and Selectors | planowany |
| M4 Wolumeny (PV/PVC) | `kubernetes-04-wolumeny-pvc` | Volumes, Persistent Volumes | planowany |
| M5 Konfiguracja (ConfigMap/Secret) | `kubernetes-05-configmap-secret` | ConfigMaps, Secrets | planowany |
| M6 Service | `kubernetes-06-service` | Service, typy Service | planowany |
| M7 Ingress | `kubernetes-07-ingress` | Ingress, Ingress Controllers | planowany |
| M8 Deployment | `kubernetes-08-deployment` | Deployments, rolling update/rollback | planowany |
| M9 Namespaces / multi-cluster | `kubernetes-09-namespaces` | Namespaces, kubeconfig/contexts | planowany |
| M10 Helm i Operatory | `kubernetes-10-helm-operatory` | Helm (helm.sh), Operator pattern | planowany |

## PRO — mapowanie (skrót, po Fundamentach)

| Kurs (moduł) | Odcinek Academy | Publiczne źródła | Uwaga |
| --- | --- | --- | --- |
| M1 RBAC / dostęp | `kubernetes-p01-rbac` | Authentication, RBAC, ServiceAccounts | filar Security |
| M2 Zasoby / QoS / autoscaling | `kubernetes-p02-zasoby-hpa` | Requests/Limits, QoS, HPA | dotyka FinOps (Twój atut) |
| M3 Zaawansowana komunikacja | `kubernetes-p03-service-adv` | EndpointSlices, cert-manager, external-dns | |
| M4 Sieć / CNI / NetworkPolicy | `kubernetes-p04-siec-networkpolicy` | Cluster Networking, Network Policies | |
| **M5 Aplikacje stanowe (StatefulSet/CSI)** | **`kubernetes-statefulset-daemonset`** | StatefulSet, CSI | ⚠️ patrz „Odcinek do przeslotowania" |
| M6 HashiCorp Vault + K8s | `kubernetes-p06-vault` | Vault docs (public) | filar Security |
| M7 Scheduler / HA | `kubernetes-p07-scheduler-ha` | Scheduling, affinity/taints, PDB | |
| M8 Monitoring / logging (DaemonSet) | `kubernetes-p08-observability` | DaemonSet, Prometheus, Loki (public) | |
| M9 Klastry w chmurze (EKS/AKS/GKE) | `kubernetes-p09-managed` | EKS/AKS/GKE docs | buduje na AWS (Twój atut) |
| M10 On-prem (kubeadm, LB) | `kubernetes-p10-onprem` | kubeadm, MetalLB | |
| M11 Troubleshooting | `kubernetes-p11-troubleshooting` | Debug Running Pods/Services | |
| M12 Bezpieczeństwo (Kyverno/Falco/PodSecurity) | `kubernetes-p12-security` | Pod Security, Kyverno, Falco (public) | filar Security |
| M13 Egzaminy/certyfikaty (CKA/CKAD/CKS) | `kubernetes-p13-cert-prep` | curriculum CNCF (public) | cel certyfikacyjny |

## Odcinek do przeslotowania

`kubernetes-02-workload-controllers` (Deployment vs StatefulSet vs DaemonSet) został wygenerowany
zanim przyjęliśmy kolejność kursu. To dobra **synteza**, ale wyprzedza program. Plan: po pobraniu
audio (agent w tle) **przenieść/zmienić nazwę** na odcinek syntezy przy Fundamenty M8 (Deployment)
/ PRO M5 (StatefulSet). Do tego czasu zostaje jako materiał bonusowy. Nie marnuje się.

## Powiązane
[[theory]], [[resources]], [[labs]], [[evidence]], [[adaptive-roadmap]], [[academy-podcasts]].
