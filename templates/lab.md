---
title:
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
tags: [lab]
# --- Pola dodatkowe dla labu katalogowego (03-labs/<lab-id>/). Opcjonalne, addytywne. ---
# lab_id:            # stabilny identyfikator = nazwa katalogu, np. aws-eks-foundation
# status:            # planned | in-progress | done
# module:            # powiązany moduł, np. kubernetes
# assessment:        # powiązany assessment (jeśli jest)
# evidence_id:       # dowód produkowany przez lab, format ev-<temat>-NNN
# cost_estimate:     # np. "~0.30 USD/h; teardown wymagany"
# teardown_required: # true | false
# Dla labu w publicznym repo rozważ classification: public / llm_exposure: allowed
# (patrz 30-standards/public-lab-security-standard.md i decyzja w [[decision-log]]).
---

## Objective

Cel labu i dowód, który wyprodukuje (`evidence_id`). Który krok pipeline domyka.

## Hipotezy

- Co zakładam, że zadziała / czego się spodziewam (do weryfikacji w Validation).

## Prerequisites

- Warunki wstępne (środowisko [[07-homelab]], przerobiona teoria, dostępy, narzędzia + wersje).

## Implementation

1. Krok 1
2. Krok 2

(Kod laba: `infra/`, `platform/`, `apps/`, `scripts/` — patrz README techniczny i [[lab-code-standard]].)

## Validation

- Obserwowalne kryterium potwierdzające sukces (komenda + oczekiwany wynik).

## Completion criteria (Definition of Done)

- kod uruchamialny, walidacja przechodzi; README + teardown + koszt; `evidence.md` z SHA;
  wpis w [[evidence-register]]; brak zakazanych artefaktów (public-safe).

## Troubleshooting

| Objaw | Przyczyna | Rozwiązanie |
| --- | --- | --- |
| _uzupełnij_ | | |

## Generated evidence

- `evidence_id`: `ev-<temat>-NNN`
- `skill`:
- `module`:
- `lab`:
- `source_ref`: `03-labs/<lab-id>/...@<commit-sha>`
- `verification_status`: unverified

Zarejestruj w [[evidence-register]]. Szczegółowy dowód: `evidence.md` (patrz `templates/lab-evidence.md`).
