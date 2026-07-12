# 00-start-here/assessments/

Historia assessmentów kompetencji (pomiary kolejne). Rozdział ról:

- **[[assessment-baseline]]** (`00-start-here/assessment-baseline.md`) — **pierwszy** pomiar
  (`assessment_version: 1`). Nie nadpisuj go kolejnymi ocenami — to punkt odniesienia.
- **`assessments/`** (ten katalog) — **kolejne** pomiary z `reassessment`. Jeden plik = jeden
  pomiar, nazwa `assessment-<YYYY-MM-DD>.md` (kebab-case, bez zakazanych fragmentów).

## Workflow (reassessment)

Komenda `reassessment` w [[academy-coach]]:
1. przeprowadza nowy assessment (kalibracja filarów 0–5),
2. podbija `assessment_version`,
3. **zapisuje wynik jako nowy plik w `assessments/`** (nie nadpisuje baseline),
4. pokazuje różnicę względem poprzedniego pomiaru (które filary w górę/w dół),
5. aktualizuje `assessment_version` w [[academy-state]] i dopisuje wpis do [[checkpoint-history]].

## Stan

_Brak plików historycznych — pierwszy `reassessment` utworzy pierwszy wpis tutaj._

## Powiązane
[[assessment-baseline]], [[academy-state]], [[checkpoint-history]], [[academy-coach]].
