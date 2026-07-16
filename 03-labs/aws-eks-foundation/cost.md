---
title: Koszt — aws-eks-foundation
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-15
updated: 2026-07-15
tags: [lab, cost, finops, eks]
lab_id: aws-eks-foundation
---

## Założenia kosztowe

- pojedyncze środowisko, krótki czas trzymania (lab uruchamiany i **niszczony tego samego dnia**);
- region i typy instancji jako zmienne — realne wartości ustala operator lokalnie, nie w repo.

## Szacowany koszt

| Zasób | Jednostka | Szacunek /h | Szacunek /mies. |
| --- | --- | --- | --- |
| EKS control plane | klaster | _uzupełnij wg cennika AWS_ | _uzupełnij_ |
| Managed node group | instancje EC2 | _uzupełnij_ | _uzupełnij_ |
| NAT / transfer | wg użycia | _uzupełnij_ | _uzupełnij_ |

> Nie wpisuję konkretnych stawek „z pamięci" — koszt zależy od regionu i typów; operator uzupełnia
> z aktualnego cennika AWS (to jawny GAP, nie zgadywanie).

## Najdroższe zasoby

- control plane (stała stawka /h) oraz węzły EC2 node group.

## Plan teardownu

- `make destroy` po zakończeniu laba; weryfikacja w konsoli/CLI, że nie zostały płatne zasoby.

## Ryzyko pozostawienia zasobów

- zapomniany klaster generuje koszt 24/7 — mitygacja: teardown tego samego dnia + budżet/alarm kosztowy.

Powiązane: [[lab-code-standard]] (koszt i teardown), [[public-lab-security-standard]].
