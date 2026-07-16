---
title: Evidence — aws-eks-foundation
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
tags: [lab, evidence, eks]
lab_id: aws-eks-foundation
evidence_id: ev-eks-001
---

## Kontekst

Dowód wykonania laba `aws-eks-foundation`. Na etapie **szkieletu brak dowodów** — lab nie został
jeszcze zaimplementowany. Sekcje wypełnia operator w miarę postępu (FACT/EVIDENCE/GAP).

## FACT — fakty zweryfikowane

- _brak_ (kod jeszcze nie istnieje; commit SHA i wyniki walidacji do uzupełnienia).

## EVIDENCE — deklaracja operatora

- _brak_ (do uzupełnienia po implementacji, oparta na FACT).

## GAP — czego brakuje

- kod Terraform (`infra/terraform/*.tf`);
- wynik `terraform validate` / `tflint` / security scan;
- obserwowalna walidacja klastra (`kubectl get nodes` → `Ready`);
- rejestracja `ev-eks-001` w [[evidence-register]] (dopiero po wyprodukowaniu dowodu).

## Problemy i rozwiązania

| Problem | Przyczyna | Rozwiązanie |
| --- | --- | --- |
| _uzupełnij w trakcie pracy_ | | |

## Rejestracja

- `evidence_id`: `ev-eks-001`
- `verification_status`: unverified
- powiązany assessment: _uzupełnij_

Zasady dowodu: [[lab-code-standard]]. Sanityzacja logów: [[public-lab-security-standard]].
Rejestr: [[evidence-register]].
