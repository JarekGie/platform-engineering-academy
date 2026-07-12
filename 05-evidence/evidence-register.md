---
title: Rejestr dowodów academy (evidence register)
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
tags: [evidence, register, pipeline]
---

## Kontekst

Rejestr dowodów kompetencji wyprodukowanych w tej academy. **Academy jest producentem evidence;**
Career OS konsumuje wpisy przez `source_system: academy` + `source_ref`, bez kopiowania treści.

Pełna treść (laby, artefakty, homelab) zostaje w tym vaulcie; Career OS trzyma tylko wskaźnik
do `evidence_id`.

## Pola wpisu (kompatybilne z Career OS)

- `evidence_id`: stabilny identyfikator, format `ev-<temat>-NNN` (np. `ev-gitops-001`),
- `skill`: kompetencja, której dowodzi wpis,
- `module`: moduł źródłowy (`02-modules/<temat>`),
- `lab`: lab / assessment / homelab / real-project, który wyprodukował dowód,
- `verification_status`: `unverified | self-verified | externally-verified`,
- `source_ref`: repo / PR / URL / ścieżka do artefaktu.

## Rejestr

| evidence_id | skill | module | lab | verification_status | source_ref |
| --- | --- | --- | --- | --- | --- |
| ev-k8s-001 | Obsługa klastra Kubernetes | kubernetes | assessment-kubernetes-foundations | unverified | _uzupełnij_ |
| ev-gitops-001 | GitOps / Continuous Delivery | kubernetes | lab-gitops-argocd | unverified | _uzupełnij_ |

## Federacja (Academy → Career OS)

```
Academy: ev-gitops-001 (tu, pełna treść)
   ↓
Career OS evidence-register: source_system: academy, source_ref: <academy-vault>#ev-gitops-001
```

## Powiązane

[[roadmap]], `02-modules/`, [[03-labs]], [[04-assessments]], [[08-real-projects]].
