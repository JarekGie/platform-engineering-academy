---
title: Glossary — Kubernetes 02: Pod
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
| Pod | Najmniejsza jednostka uruchomieniowa w Kubernetes; grupuje 1+ kontenerów dzielących sieć i storage. |
| Container | Uruchomiony obraz aplikacji; w Kubernetes żyje wewnątrz Poda, nie samodzielnie. |
| Współdzielenie sieci | Kontenery w jednym Podzie mają wspólne IP i porty — komunikują się przez `localhost`. |
| Efemeryczność | Pod jest nietrwały — usunięty/przeniesiony nie wraca „sam z siebie"; zajmują się tym controllery. |
| Manifest | Deklaratywny opis obiektu w YAML (apiVersion, kind, metadata, spec). |
| Init container | Kontener uruchamiany PRZED głównymi, w kolejności; do przygotowania środowiska (np. migracje, oczekiwanie na zależność). |
| Sidecar container | Kontener towarzyszący głównemu w Podzie (np. proxy, agent logów), działa równolegle. |
| restartPolicy | Polityka restartu kontenerów w Podzie: `Always` / `OnFailure` / `Never`. |
| Liveness probe | Sonda sprawdzająca „czy żyje" — po niepowodzeniu kubelet **restartuje** kontener. |
| Readiness probe | Sonda „czy gotowy na ruch" — dopóki nie przejdzie, Service nie kieruje ruchu do Poda. |
| Startup probe | Sonda dla wolno startujących aplikacji — wstrzymuje pozostałe sondy, aż aplikacja wstanie. |
| `kubectl exec` | Wejście do kontenera w Podzie (np. `-- sh`) w celu diagnozy. |
| `kubectl port-forward` | Przekierowanie portu z hosta do Poda — dostęp lokalny bez Service. |
| `kubectl logs` | Podgląd logów kontenera w Podzie. |
| CrashLoopBackOff | Stan, gdy kontener wciąż pada i jest restartowany z narastającym opóźnieniem. |

## Powiązane
[[source-pack]], [[podcast-brief]].
