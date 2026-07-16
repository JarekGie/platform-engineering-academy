---
title: Log sesji
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-16
tags: [session-log, reference]
---

Chronologiczny log sesji pracy w vaultcie. Skill [[end-day]] dopisuje wpisy na końcu.
Nie usuwaj wpisów. Jeden wpis = jedna sesja = jedna domena.

## Wpisy

### 2026-07-12 — jgolab — domena: learning (+ shared-concept)

- Zrobione:
  - Onboarding Academy ([[academy-coach]]): profil, assessment bazowy (v1), cel
    **Senior Platform Engineer**, preferencje (podcast-first, 25 min), roadmapa 90/180/365.
  - Context-pack o vaultcie dla ChatGPT ([[vault-zastosowania-i-mozliwosci]], domena shared-concept).
  - Kompletny odcinek podcastu **Kubernetes 01 — architektura klastra** ([[academy-podcasts]]):
    source-pack (3 publiczne źródła), brief, glossary, questions, feedback + wygenerowane w
    NotebookLM: Audio Overview (PL), quiz (10 pytań), flashcards.
  - **Lab klastra** [[lab-minikube-qemu-klaster]] (minikube + qemu2, sieć builtin) → pierwszy
    dowód **`ev-k8s-001` self-verified** (węzeł Ready). Pętla K8s 01 domknięta pipeline'em.
- Otwarte:
  - Uzupełnić `02-modules/kubernetes/theory.md` własnymi słowami po odsłuchu.
  - Odcinek 02: workload controllers (Deployment vs StatefulSet) — luka z assessmentu.
  - Lab kind/minikube (`kubectl get nodes`) → dowód `ev-k8s-001`.
- Dotknięte notatki: [[academy-state]], [[assessment-baseline]], [[adaptive-roadmap]],
  [[current-goal]], [[learning-preferences]], [[learning-profile]], [[checkpoint-history]],
  [[now]], [[vault-zastosowania-i-mozliwosci]], odcinek `generated-podcasts/kubernetes/kubernetes-01-architektura-klastra/`.
- Uwaga: mp3 podcastu (61 MB) świadomie w `.gitignore` — artefakt pochodny, regenerowalny z NotebookLM.
- Branch / commit: `jgolab/2026-07-12` / `feat(learning): onboarding Academy + podcast K8s 01`

### 2026-07-13 — jgolab — domena: learning

- Zrobione:
  - Przestawienie ścieżki Kubernetes na **companion do kursu kubernetespopolsku** (kolejność
    kursu): [[companion-plan]] mapuje Fundamenty M1–M10 + PRO M1–M13 na odcinki/laby Academy.
    Granica licencyjna zapisana: tylko publiczny spis tematów, treść kursu poza NotebookLM.
  - Test **kroku 9 [[end-day]]** (pre-generacja podcastu): wygenerowany bonusowy odcinek
    `kubernetes-02-workload-controllers` (Deployment/StatefulSet/DaemonSet, audio PL) — do przeslotowania.
  - Odcinek **02 = Pod** (Fundamenty M2): source-pack (6 publicznych źródeł, w tym PL „Pod"),
    brief, glossary, questions, feedback + audio PL. Sam podcast (quiz/flashcards w learning-loop).
  - Aktualizacje modułu: [[resources]] (kurs jako źródło), [[labs]] (lab klastra done), [[academy-state]].
- Otwarte:
  - Przeslotować `kubernetes-02-workload-controllers` przy Deployment (F M8) / StatefulSet (PRO M5).
  - Odsłuchać odc. 02 Pod → kurs M2 → lab Pod na klastrze → quiz/flashcards.
  - Następny odcinek: M3 ReplicaSet/skalowanie (pre-generacja krok 9).
- Dotknięte notatki: [[companion-plan]], [[resources]], [[labs]], [[academy-state]],
  odcinki `generated-podcasts/kubernetes/kubernetes-02-pod/` i `kubernetes-02-workload-controllers/`.
- Uwaga: pliki mp3 (~44 MB + ~37 MB) w `.gitignore` — regenerowalne z NotebookLM.
- Branch / commit: `jgolab/2026-07-13` / `feat(learning): companion kursu K8s + odcinek 02 Pod`

### 2026-07-16 — jgolab — domena: shared-concept (+ learning)

- Zrobione:
  - **Monorepo dla uruchamialnego kodu labów** (audyt read-only → plan → implementacja Faz 2–10):
    - standardy [[lab-code-standard]], [[public-lab-security-standard]], [[lab-code-review-standard]];
    - szablony laba katalogowego (`templates/lab-readme|evidence|architecture|lessons-learned|cost`)
      + rozszerzony `templates/lab.md` (addytywnie, bez zmiany klasyfikacji);
    - `bin/validate-vault.sh` (frontmatter/enumy/wiki-links/dup lab_id/artefakty) — naprawia
      dangling ref z [[MANDATORY_WORKFLOW_CONTRACT]]; walidacja zmienionych plików: 0 błędów;
    - CI path-filtered `.github/workflows/`: `docs` (tylko zmienione .md), `secret-scan`
      (gitleaks, pełna historia), `terraform` (wzorzec, bez plan/apply/AWS);
    - `.gitignore` (IaC/sekrety; `*.example` + lockfile śledzone), `.editorconfig`, `.markdownlint.yaml`;
    - szkielet [[03-labs/aws-eks-foundation/lab|aws-eks-foundation]] — **bez kodu EKS**, Makefile bez atrap.
  - **ADR-0002 (proponowana)** przez [[decision-note]]: napięcie publiczne repo vs `classification: internal`.
  - Rozszerzony context-pack [[vault-zastosowania-i-mozliwosci]] (rola reviewera + strategia repo).
  - Commit pending pre-generowanego podcastu `kubernetes-03-replicaset-skalowanie` z sesji 07-13.
- Otwarte:
  - Decyzja operatora do ADR-0002 + osobne zadanie: inwentaryzacja notatek `internal` (public-safe?).
  - Weryfikacja przypiętych wersji narzędzi w CI; `pre-commit` z pierwszym realnym kodem Terraform.
  - Baseline: 12 pre-existing dangling wiki-links w korpusie → osobne zadanie „pełny skan".
  - Kontynuacja nauki K8s: odsłuchać backlog (02 Pod, 02-workload-controllers, 03 ReplicaSet).
- Dotknięte notatki: [[now]], standardy `30-standards/`, szablony `templates/`, [[decision-log]],
  `03-labs/aws-eks-foundation/`, [[vault-zastosowania-i-mozliwosci]], `README`, `.github/`, `bin/`.
- Krok 9 (pre-generacja kolejnego podcastu): **pominięty** — istnieje backlog nieodsłuchanych
  odcinków, a sesja była frameworkowa; nowe audio nieuzasadnione (zgłoszone operatorowi).
- Branch / commit: `jgolab/2026-07-16` / `feat(framework): monorepo dla uruchamialnego kodu labów`
