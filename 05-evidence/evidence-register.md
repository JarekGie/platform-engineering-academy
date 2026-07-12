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
| ev-k8s-001 | Obsługa klastra Kubernetes | kubernetes | lab-minikube-qemu-klaster | self-verified | `03-labs/lab-minikube-qemu-klaster.md` (minikube status + kubectl get nodes, 2026-07-12) |
| ev-gitops-001 | GitOps / Continuous Delivery | kubernetes | lab-gitops-argocd | unverified | _uzupełnij_ |
| ev-csec-001 | Baseline posture (GuardDuty + Security Hub) | security-platform/cloud-security | lab-csec-guardduty-securityhub | unverified | _uzupełnij_ |
| ev-csec-002 | Guardrail organizacyjny (SCP deny-region) | security-platform/cloud-security | lab-csec-scp-deny-region | unverified | _uzupełnij_ |
| ev-iam-001 | Least privilege + wymuszenie MFA | security-platform/identity-and-access | lab-iam-least-privilege-mfa | unverified | _uzupełnij_ |
| ev-iam-002 | Audytowalny dostęp awaryjny (break-glass) | security-platform/identity-and-access | lab-iam-break-glass | unverified | _uzupełnij_ |
| ev-secr-001 | Dynamic secrets + rotacja z TTL (Vault/OpenBao) | security-platform/secrets-management | lab-secr-dynamic-db-rotation | unverified | _uzupełnij_ |
| ev-gov-001 | Control-as-code (Config rules + raport) | security-platform/security-governance | lab-gov-config-rules | unverified | _uzupełnij_ |
| ev-gov-002 | Control mapping: wymaganie → kontrola → dowód | security-platform/security-governance | lab-gov-control-mapping | unverified | _uzupełnij_ |

## Federacja (Academy → Career OS)

```
Academy: ev-gitops-001 (tu, pełna treść)
   ↓
Career OS evidence-register: source_system: academy, source_ref: <academy-vault>#ev-gitops-001
```

## Powiązane

[[roadmap]], `02-modules/`, [[03-labs]], [[04-assessments]], [[08-real-projects]].
