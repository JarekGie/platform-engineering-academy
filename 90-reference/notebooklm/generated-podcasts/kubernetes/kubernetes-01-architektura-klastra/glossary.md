---
title: Glossary — Kubernetes 01: architektura klastra
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
tags: [podcast, glossary, notebooklm, kubernetes]
---

## Słownik pojęć

Terminy zostają w oryginale (reguła językowa z [[podcast-brief]]); definicje po polsku.

| Pojęcie | Definicja (1–2 zdania) |
| --- | --- |
| Cluster | Zbiór maszyn (control plane + worker nodes) zarządzanych jako jedna całość przez Kubernetes. |
| Control plane | „Mózg" klastra — podejmuje globalne decyzje (harmonogramowanie, reakcja na zdarzenia) i trzyma stan. |
| Worker node | Maszyna (fizyczna/wirtualna), na której faktycznie działają aplikacje w Podach. |
| Pod | Najmniejsza jednostka uruchomieniowa w Kubernetes — jeden lub kilka kontenerów dzielących sieć i storage. |
| kube-apiserver | Centralna brama klastra; udostępnia REST API i jest jedynym komponentem zapisującym stan do etcd. |
| etcd | Rozproszona baza key-value przechowująca cały stan klastra (konfiguracje wszystkich obiektów). |
| kube-scheduler | Decyduje, na którym węźle umieścić nowy Pod, uwzględniając zasoby i ograniczenia (affinity, taints). |
| kube-controller-manager | Uruchamia pętle kontrolne (controllers), które obserwują stan i dążą do stanu pożądanego. |
| cloud-controller-manager | Integruje klaster z API dostawcy chmury (np. load balancery, węzły, wolumeny). |
| kubelet | Agent na każdym węźle; odbiera definicje Podów z API servera i pilnuje, by kontenery działały. |
| kube-proxy | Implementuje reguły sieciowe dla obiektów Service i kieruje ruch wewnątrz klastra. |
| Container runtime | Oprogramowanie uruchamiające kontenery (containerd, CRI-O); zgodne z interfejsem CRI. |
| Reconcile loop | Pętla uzgadniania: Kubernetes porównuje stan faktyczny z pożądanym i wprowadza zmiany, aż się zgodzą. |
| Deklaratywny model | Opisujesz stan docelowy (co ma być), a nie kroki (jak to zrobić) — Kubernetes sam dochodzi do celu. |
| kubectl | Narzędzie CLI do komunikacji z klastrem przez kube-apiserver (np. `kubectl get nodes`). |
| Addons | Dodatkowe komponenty klastra (np. CoreDNS, Dashboard, monitoring) rozszerzające funkcje bazowe. |

## Powiązane
[[source-pack]], [[podcast-brief]].
