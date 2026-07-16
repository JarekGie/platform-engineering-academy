# 03-labs

Krok 3 pipeline: **laboratoria**. Praktyczne ćwiczenia realizowane (często w [[07-homelab]]).
Każdy lab wspiera: objective · prerequisites · implementation · validation · troubleshooting ·
generated evidence. Nowe laby skrobaj z szablonu `templates/lab.md`.

Laby produkują dowody (`evidence_id`) rejestrowane w [[evidence-register]].

Pipeline: Roadmap → Theory → **Lab** → Assessment → Homelab → Evidence → Real Project.

## Laby z kodem (model katalogowy)

Lab może zawierać **uruchamialny kod** — wtedy jest katalogiem `03-labs/<lab-id>/` (a nie płaską
notatką). Struktura, zasady i Definition of Done: [[lab-code-standard]]. Bezpieczeństwo publicznego
repo (zakazane artefakty, placeholdery, sanityzacja): [[public-lab-security-standard]]. Review kodu
i ocena poziomu: [[lab-code-review-standard]].

- **Nowy lab z kodem:** skrob z `templates/lab.md`, `templates/lab-readme.md`, `templates/lab-evidence.md`
  (+ `lab-architecture.md`, `lab-lessons-learned.md`, `lab-cost.md` wg potrzeb). Wzorzec:
  `03-labs/aws-eks-foundation/`.
- **Walidacja:** `make fmt validate lint` w katalogu laba + `bin/validate-vault.sh` + CI.
- **Model grandfathered:** istniejące płaskie notatki (`lab-minikube-qemu-klaster`, `lab-gitops-argocd`)
  pozostają ważne bez przenoszenia. Nie tworzymy dwóch źródeł prawdy dla jednego laba.
