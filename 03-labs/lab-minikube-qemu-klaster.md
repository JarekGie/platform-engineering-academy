---
title: Lab — klaster Kubernetes na minikube (driver qemu2)
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
tags: [lab, kubernetes, minikube, qemu]
---

## Objective

Postawić lokalny klaster Kubernetes na **minikube** z driverem **qemu2** (wirtualizacja, bez
Docker Desktop) i potwierdzić działanie przez `kubectl get nodes`. Dowód: `ev-k8s-001`
(uruchomienie i obsługa klastra). Domyka krok Lab po podcaście [[glossary|Kubernetes 01 — architektura klastra]].

## Prerequisites

- macOS na Apple Silicon (arm64), tu: macOS 26.0.
- `minikube` v1.38.0 (`/opt/homebrew/bin/minikube`).
- `qemu` 11.0.2 (`brew install qemu`) — wirtualizator.
- Świadoma rezygnacja z socket_vmnet na rzecz sieci `builtin` (patrz Troubleshooting).

## Implementation

```bash
# driver domyślny = qemu2 (kanoniczna nazwa; alias "qemu" działa tylko przy --driver)
minikube config set driver qemu2

# świeży start; sieć user-mode (builtin) — bez roota i socket_vmnet
minikube delete
minikube start --driver=qemu2 --network=builtin

# weryfikacja
minikube status
kubectl get nodes -o wide
```

## Validation

Zaobserwowany stan (2026-07-12, terminal operatora):

```
minikube status
  host: Running | kubelet: Running | apiserver: Running | kubeconfig: Configured

kubectl get nodes -o wide
  NAME     STATUS  ROLES         AGE  VERSION  INTERNAL-IP  OS-IMAGE          KERNEL   RUNTIME
  minikube Ready   control-plane 22m  v1.35.0  10.0.2.15    Buildroot 2025.02 6.6.95   docker://28.5.2
```

Kryterium sukcesu spełnione: węzeł `minikube` w stanie **Ready**. INTERNAL-IP `10.0.2.15`
potwierdza sieć user-mode (`builtin`).

## Troubleshooting

| Objaw | Przyczyna | Rozwiązanie |
| --- | --- | --- |
| `DRV_UNSUPPORTED_OS: Sterownik 'quemu' niewspierany` | literówka w nazwie drivera (`quemu`) | użyj `qemu` lub `qemu2` |
| `MK_CONFIG_SET: driver "qemu" is not supported` | `config set` waliduje nazwę kanoniczną | `minikube config set driver qemu2` (nie `qemu`) |
| `Failed to connect to ".../socket_vmnet": Permission denied` | socket to `root:staff` (mode 770); konto domenowe AD ma grupę podstawową `Domain Users`, nie jest w `staff` | zrezygnuj z socket_vmnet → `--network=builtin` (bez roota); alternatywnie dostosuj grupę socketa po każdym starcie |

## Uwagi

- `--network=builtin`: host nie routuje do IP klastra → `minikube service`/LoadBalancer/ingress-z-hosta
  nie działają wprost; używaj `kubectl port-forward`. Do labów podstawowych wystarcza.
- socket_vmnet (pełna sieć) zostawione na później — problematyczne na koncie domenowym AD.

## Generated evidence

- `evidence_id`: `ev-k8s-001`
- `skill`: uruchomienie i obsługa klastra Kubernetes (minikube/qemu2)
- `module`: [[theory|kubernetes]]
- `lab`: [[lab-minikube-qemu-klaster]]
- `source_ref`: `minikube status` + `kubectl get nodes -o wide` (2026-07-12)
- `verification_status`: self-verified (zaobserwowany węzeł Ready, 2026-07-12)

Zarejestruj w [[evidence-register]].
