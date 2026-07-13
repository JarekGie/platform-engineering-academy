---
title: Glossary — Kubernetes 02: workload controllers
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

Terminy w oryginale (reguła językowa z [[podcast-brief]]); definicje po polsku.

| Pojęcie | Definicja (1–2 zdania) |
| --- | --- |
| Controller | Obiekt, który utrzymuje stan pożądany zbioru Podów (reconcile loop); nie zarządzasz Podami ręcznie. |
| ReplicaSet | Utrzymuje zadaną liczbę identycznych Podów; fundament pod Deployment (zwykle nie tworzysz go wprost). |
| Deployment | Controller dla aplikacji **bezstanowych**: deklaratywne aktualizacje, rolling update, rollback, skalowanie. |
| StatefulSet | Controller dla aplikacji **stanowych**: stabilna tożsamość Podów, uporządkowane skalowanie, PVC per Pod. |
| DaemonSet | Zapewnia po jednym Podzie na każdym (lub wybranym) node; agenty logów, monitoringu, sieci. |
| Stateless (bezstanowy) | Aplikacja, której Pody są wymienne — żaden nie musi pamiętać stanu między żądaniami. |
| Stateful (stanowy) | Aplikacja wymagająca trwałego stanu i tożsamości (bazy, kolejki, systemy konsensusu). |
| Rolling update | Stopniowa wymiana Podów na nową wersję bez przerwy w działaniu. |
| Rollback | Powrót do poprzedniej wersji Deploymentu, gdy nowa jest wadliwa. |
| PersistentVolumeClaim (PVC) | Żądanie trwałego wolumenu; w StatefulSet każdy Pod dostaje własny, przypisany na stałe. |
| Headless Service | Service bez ClusterIP, dający stabilne DNS per Pod — używany ze StatefulSet. |
| Sticky identity | Trwała tożsamość Poda w StatefulSet (`app-0`, `app-1`) zachowana mimo restartu/reschedulingu. |
| Job / CronJob | Controllery zadań: jednorazowego (Job) i cyklicznego wg harmonogramu (CronJob). |
| `kubectl scale` | Komenda zmieniająca liczbę replik controllera. |
| `kubectl rollout` | Komenda zarządzająca wdrożeniem/rollbackiem Deploymentu (`status`, `undo`, `history`). |

## Powiązane
[[source-pack]], [[podcast-brief]].
