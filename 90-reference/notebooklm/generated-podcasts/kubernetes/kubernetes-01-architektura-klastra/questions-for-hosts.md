---
title: Questions for hosts — Kubernetes 01: architektura klastra
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
tags: [podcast, questions, notebooklm, kubernetes]
---

## Pytania prowadzące (od ogółu do konkretu)

1. Po co w ogóle Kubernetes, skoro potrafimy uruchamiać kontenery Dockerem? Jaki problem
   rozwiązuje w skali wielu maszyn?
2. Co to znaczy, że klaster dzieli się na **control plane** i **worker nodes** — kto za co odpowiada?
3. Przejdźmy przez control plane: co robi **kube-apiserver**, dlaczego **etcd** jest tak
   krytyczny, i czym różni się rola **kube-scheduler** od **kube-controller-manager**?
4. Co dzieje się na **worker node**: jaka jest rola **kubelet**, **kube-proxy** i **container runtime**?
5. Co to jest **reconcile loop** i dlaczego model **deklaratywny** zmienia sposób myślenia o
   utrzymaniu aplikacji?
6. Prześledźmy jedną komendę: co się dzieje w klastrze od `kubectl apply` do uruchomionego Poda?

## Pytania pogłębiające (dla wyższych poziomów, 3–5)

- Co się stanie z klastrem, gdy padnie **etcd**? A gdy padnie **kube-apiserver**? Czy działające
  Pody przestaną działać?
- Dlaczego to **kubelet** (na węźle), a nie scheduler, faktycznie uruchamia kontenery? Gdzie
  przebiega granica odpowiedzialności?
- Jak model deklaratywny + reconcile loop wypada w porównaniu z podejściem imperatywnym (np.
  skrypty w Ansible), które słuchacz już zna?

## Powiązane
[[podcast-brief]], [[glossary]].
