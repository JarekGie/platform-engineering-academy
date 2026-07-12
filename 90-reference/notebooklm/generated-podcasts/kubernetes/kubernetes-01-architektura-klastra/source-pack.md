---
title: Source pack — Kubernetes 01: architektura klastra
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

Source-pack dla odcinka **Kubernetes 01 — architektura klastra** (etap 90 dni z [[adaptive-roadmap]],
filar Kubernetes, poziom 1 Junior → 2 Mid). Odbiorca: podcast-first, sesje 25 min.

**Uwaga o źródłach:** zamiast notatek vaulta (jedyna notatka teorii jest `allowed_internal_only` —
patrz sekcja Odrzucone) używamy **publicznych, polskojęzycznych materiałów** o Kubernetes.
Są klasyfikacji publicznej (`shared-concept`), więc bezpiecznie przechodzą hard gate do NotebookLM.
Wskaźniki (URL), nie kopiujemy treści.

## Źródła zatwierdzone (publiczne, jedna domena: shared-concept)

Dodaj te URL-e jako źródła w NotebookLM.

| # | Źródło | Język | Dostęp | Weryfikacja | Pokrycie architektury |
| --- | --- | --- | --- | --- | --- |
| 1 | [Oficjalna dokumentacja PL — Podstawowe składniki (Components)](https://kubernetes.io/pl/docs/concepts/overview/components/) | PL (oficjalne tłumaczenie) | darmowy | ✅ zweryfikowane | control plane (kube-apiserver, etcd, kube-scheduler, kube-controller-manager, cloud-controller-manager) + node (kubelet, kube-proxy, container runtime) + addons |
| 2 | [Oficjalna dokumentacja — Cluster Architecture](https://kubernetes.io/docs/concepts/architecture/) | EN (autorytatywne) | darmowy | ✅ oficjalne | pełna architektura, diagramy, node lifecycle |
| 3 | [Oktawave — Podstawy architektury Kubernetesa](https://oktawave.com/pl/blog/kubernetes/podstawy-architektury-kubernetesa/) | PL | darmowy | ✅ zweryfikowane | control plane, node, Pod, kubelet, etcd, kubectl (brak kube-proxy/runtime) |
| 4 | [Studio Kalmus — Kubernetes w 2025: jak działa](https://studiokalmus.com/kubernetes-w-2025-jak-dziala-dlaczego-jest-kluczowy-i-od-czego-zaczac) | PL | darmowy | ⚠️ z wyszukiwania — zweryfikuj treść przy dodawaniu | control plane + worker nodes + komponenty (świeży, 2025) |
| 5 | [P-programowanie — Kubernetes: podstawy orkiestracji kontenerów](https://www.p-programowanie.pl/kubernetes-podstawy-orkiestracji-kontenerow/) | PL | darmowy | ⚠️ z wyszukiwania — zweryfikuj treść przy dodawaniu | rozdział odpowiedzialności control plane vs worker nodes |
| 6 | [YouTube — Wprowadzenie do Kubernetesa, Lekcja 1](https://www.youtube.com/watch?v=J_BAp7Pebwc) | PL (wideo) | darmowy | ⚠️ z wyszukiwania — zweryfikuj przy dodawaniu | czym jest K8s, architektura, najważniejsze komponenty |

**Rekomendacja rdzenia (dla najwyższego pokrycia):** źródła **1 + 2 + 3** dają komplet
komponentów architektury; 4–6 dodają polskojęzyczny kontekst i powtórzenie.

## Materiały rozszerzone (płatne — NIE do NotebookLM, do samodzielnej nauki)

Nie dodawaj do NotebookLM (płatne / licencja). Do pogłębienia teorii i przygotowania do CKA:

| Źródło | Charakter | Uwaga |
| --- | --- | --- |
| [Kurs „Kubernetes po polsku"](https://kubernetespopolsku.pl/) | płatny kurs (Fundamenty/PRO) | darmowa **Mapa Kubernetes** do pobrania + lekcje demo; przygotowuje do CKA/CKAD/CKS |
| [Helion — „Kubernetes. Tworzenie niezawodnych systemów rozproszonych" (Hightower/Burns/Beda)](https://helion.pl/ksiazki/kubernetes-tworzenie-niezawodnych-systemow-rozproszonych-kelsey-hightower-brendan-burns-joe-beda,kubern.htm) | płatna książka (PL) | przewodnik od twórców Kubernetes |

## Odrzucone (hard gate — i dlaczego)

| Kandydat | Powód odrzucenia |
| --- | --- |
| [[theory]] (`02-modules/kubernetes/theory.md`) | `llm_exposure: allowed_internal_only` — NIGDY nie eksportujemy do NotebookLM (narzędzie zewnętrzne). Pozostaje wewnętrznym źródłem prawdy; podcast jest artefaktem pochodnym z materiałów publicznych. |

## NotebookLM — wygenerowano (2026-07-12)

Notatnik utworzony w NotebookLM z hard-gate'owanych źródeł 1–3. Audio Overview po polsku.

| Element | Wartość |
| --- | --- |
| Notebook ID | `b9b36c04-a9b1-40c3-9056-9535fc26e6b8` |
| Notebook | „Kubernetes 01 — architektura klastra" |
| Źródło 1 (Składniki Kubernetesa, PL) | `2ba4062f-37c9-46ac-9d1d-574272d154ed` — ready |
| Źródło 2 (Cluster Architecture, EN) | `8f8e43cf-22d5-404f-bfee-7b6d8678d8fd` — ready |
| Źródło 3 (Oktawave, PL) | `c69a54fe-1992-44d8-9462-03f7f2c4e5b5` — ready |
| Audio task/artifact ID | `881845e2-0891-4c5b-a77b-db6e76827f54` → `kubernetes-01-architektura-klastra.mp3` |
| Quiz artifact ID | `92deac84-9167-4a1d-80c1-4ebb863fd987` → `quiz.md` |
| Flashcards artifact ID | `58843cf2-066d-4114-bf29-dec864a104b7` → `flashcards.md` |

## Powiązane
[[podcast-brief]], [[glossary]], [[questions-for-hosts]], [[NOTEBOOKLM_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]].
