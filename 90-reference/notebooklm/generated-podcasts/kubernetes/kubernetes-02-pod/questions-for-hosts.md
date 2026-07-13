---
title: Questions for hosts — Kubernetes 02: Pod
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

1. Skoro znamy kontenery z Dockera — po co warstwa Pod? Co Pod dodaje ponad pojedynczy container?
2. Dlaczego mówimy, że Pod jest „jak apartament"? Co dokładnie współdzielą kontenery w jednym Podzie?
3. Jak wygląda najprostszy manifest Poda i jakimi komendami `kubectl` go obsługujemy (get, describe, logs, exec)?
4. Do czego służą **init containers**, a do czego **sidecar** — czym się różnią kolejnością i rolą?
5. Pod padł / zawisł — co się dzieje? Jak `restartPolicy` i **liveness probe** przywracają kontener do życia?
6. Czym różni się **liveness** od **readiness** probe — i dlaczego mylenie ich potrafi wywołać problemy z ruchem?

## Pytania pogłębiające (dla wyższych poziomów, 3–5)

- Dlaczego Pod jest efemeryczny i czemu w praktyce prawie nigdy nie tworzymy „gołych" Podów bez controllera?
- Co to jest **CrashLoopBackOff**, skąd się bierze i jak go diagnozować (`describe`, `logs`, probes)?
- Kiedy potrzebna jest **startup probe** i jak współgra z liveness/readiness dla wolno startujących aplikacji?

## Powiązane
[[podcast-brief]], [[glossary]].
