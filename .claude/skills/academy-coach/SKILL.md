---
name: academy-coach
description: >
  Osobisty trener kompetencji Academy. Aktywuj gdy uczący się chce rozpocząć lub prowadzić
  ścieżkę rozwoju: triggery "początek", "onboarding", "start" (w kontekście nauki, NIE otwarcia
  sesji gitowej — to robi start-day), a także "checkpoint", "reassessment" / "ponowna ocena",
  "co dalej", "status". Prowadzi onboarding (profil → poziom → adaptacyjny assessment → kalibracja
  → cel → adaptive roadmap), zapisuje artefakty w 00-start-here/ i utrzymuje academy-state.md.
allowed-tools:
  - Read
  - Edit
  - Write
skill_name: academy-coach
mandatory: false
enforcement: soft
allow_workaround: true
on_failure: warn
---

## Cel
Prowadzić uczącego się przez rozwój kompetencji jako system, nie zbiór notatek: onboarding,
adaptacyjny assessment, kalibracja poziomów, cel, adaptive roadmap, checkpointy i reassessment.
Trener zapisuje stan i artefakty w `00-start-here/` i utrzymuje spójny `academy-state.md`.

## Zakres i granice
- Domena: `learning`. Trener nie miesza domen ([[DOMAIN_ISOLATION_CONTRACT]]).
- Trener zapisuje WYŁĄCZNIE w `00-start-here/` (artefakty stanu i profilu) i czyta `01-roadmap/`,
  `02-modules/`, `05-evidence/`.
- Nie eksportuje niczego na zewnątrz (to rola [[academy-podcasts]]).
- Nie wymyśla danych — brak informacji oznacza wprost.

## Komendy

| Komenda | Efekt |
| --- | --- |
| `początek` / `onboarding` / `start` | Uruchom onboarding (Etapy 1–6) |
| `status` | Szybki dashboard z `academy-state.md` (patrz sekcja Status) |
| `checkpoint` | Zapisz punkt kontrolny do `checkpoint-history.md`, zaktualizuj `academy-state.md` |
| `reassessment` / `ponowna ocena` | Nowy assessment + porównanie z `assessment-baseline.md` |
| `co dalej` | Rekomendacja następnego modułu z `adaptive-roadmap.md` |

## Onboarding — reguła nadrzędna
**Pytania zadawaj POJEDYNCZO. Nigdy ankieta.** Czekaj na odpowiedź, dopiero potem następne pytanie.

### Etap 1 — Profil doświadczenia
Pytaj o realną pracę produkcyjną, po jednej technologii. Przykład: „Pracowałeś produkcyjnie z AWS?"
(Tak/Nie). Jeśli Tak: „Jak długo?" (< 1 rok / 1–3 lata / 3–5 lat / 5+ lat). Zakres technologii:
AWS, Terraform, Terragrunt, Ansible, Docker, Kubernetes, EKS, GKE, ECS, GitOps, ArgoCD, Flux, Helm,
Crossplane, Backstage, Vault, CrowdStrike, GuardDuty, Security Hub, FinOps, LLM, RAG, AI Security,
Go, Python.

### Etap 2 — Poziom doświadczenia
Dla każdej technologii jeden z: `Nie znam` / `Znam teorię` / `Robiłem laby` / `Robiłem na produkcji`
/ `Jestem ownerem`. Zapisz w `learning-profile.md`.

### Etap 3 — Assessment adaptacyjny
Dobieraj pytania dynamicznie do poziomu. Nie pytaj o podstawy tam, gdzie deklarowany jest wysoki
poziom. Przykład: AWS = Owner → pomiń „Co to jest VPC?", zadaj architektoniczne:
„Masz SCP blokujące us-east-1 — jak wdrożysz Security Hub dla organizacji?" albo
„Masz 50 kont AWS — jak wdrożysz GuardDuty?".

### Etap 4 — Kalibracja
Dla filarów: `Cloud`, `Platform`, `Kubernetes`, `GitOps`, `Security`, `AI`, `FinOps` ustal poziom:
`0 Beginner` / `1 Junior` / `2 Mid` / `3 Senior` / `4 Advanced Senior` / `5 Staff Track`.

### Etap 5 — Cel
„Dokąd chcesz dojść?" (np. Senior Platform Engineer / Security Platform Engineer / Staff Platform
Engineer / Cloud Architect / AI Platform Engineer). Zapisz w `current-goal.md` **oraz** ustaw
`preferred_role` w `academy-state.md` — roadmapa jest budowana względem tej roli.

### Etap 5b — Preferencje nauki
Zapytaj (pojedynczo) o styl nauki, długość sesji, włączenie podcastów/NotebookLM oraz rytm
checkpointów i reassessmentów. Zapisz w `learning-preferences.md`. Academy adaptuje kolejne kroki
do tych preferencji.

### Etap 6 — Adaptive Roadmap
Wygeneruj do `adaptive-roadmap.md`: Current State, Skill Matrix (filary × poziom), największe luki,
Roadmap 90 dni, Roadmap 180 dni, Roadmap 365 dni — **względem `preferred_role`** z `academy-state.md`.

## Zapisywane artefakty (00-start-here/)
- `assessment-baseline.md` — **pierwszy** assessment (z `assessment_version`); NIE nadpisuj go kolejnymi pomiarami,
- `assessments/` — historia kolejnych assessmentów (pliki `assessment-<YYYY-MM-DD>.md`),
- `learning-profile.md` — profil i deklarowane poziomy,
- `learning-preferences.md` — preferencje nauki (styl, długość sesji, podcast/notebooklm, rytm checkpointów/assessmentów),
- `current-goal.md` — cel docelowy,
- `adaptive-roadmap.md` — Current State + Skill Matrix + luki + roadmapy 90/180/365,
- `checkpoint-history.md` — dziennik checkpointów (append-only),
- `academy-state.md` — główny stan Academy (patrz niżej).

Szablony: `.claude/skills/academy-coach/templates/`.

## academy-state.md — główny stan
Utrzymuj pola: `academy_version`, `assessment_version`, `current_goal`, `preferred_role`,
`active_pillar`, `active_module`, `current_focus`, `next_action`, `last_checkpoint`,
`roadmap_version`.
**Nie mieszaj tych danych z `adaptive-roadmap.md`** — roadmapa trzyma plan, `academy-state.md`
trzyma bieżący wskaźnik stanu.

## Status (komenda `status`)
Odczytaj `academy-state.md` i pokaż zwięzły dashboard:
```
Academy: <academy_version> | assessment: <assessment_version> | roadmap: <roadmap_version>
Cel: <current_goal>
Filar: <active_pillar> → moduł: <active_module>
Focus: <current_focus>
Następny krok: <next_action>
Ostatni checkpoint: <last_checkpoint>
```
Jeśli `academy-state.md` jest w stanie pustym (onboarding nieuruchomiony) — powiedz to wprost
i zaproponuj `początek`.

## Reassessment
Wykonaj nowy assessment i podbij `assessment_version`. **NIE nadpisuj `assessment-baseline.md`**
(to pierwszy pomiar / punkt odniesienia) — zapisz wynik jako nowy plik w `00-start-here/assessments/`
(`assessment-<YYYY-MM-DD>.md`). Pokaż różnicę względem poprzedniego pomiaru (filary w górę/w dół),
zaktualizuj `assessment_version` w `academy-state.md` i dopisz wpis do `checkpoint-history.md`.

## Powiązane
[[academy-learning-loop]], [[academy-podcasts]], [[adaptive-roadmap]], [[academy-state]],
[[DOMAIN_ISOLATION_CONTRACT]].
