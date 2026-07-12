# Przykład: koniec sesji ("fajrant")

Operator: **„fajrant, commituj i pchaj"**. Aktywna domena z `now.md`: `aiops`,
branch `jgolab/2026-06-10`.

## Co robi skill

1. Czyta `now.md` — operator jgolab, domena aiops.
2. Dopisuje wpis do `90-reference/session-log.md`:

   ```
   ### 2026-06-10 — jgolab — domena: aiops
   - Zrobione: dodano runbook restartu zadania ECS + analiza p95 load testu UAT
   - Otwarte: weryfikacja progu alarmu CloudWatch
   - Dotknięte notatki: [[40-runbooks/ecs-task-restart]], [[20-projects/maspex-uat-loadtest]]
   - Branch / commit: jgolab/2026-06-10 / feat(aiops): runbook restartu ECS + analiza p95
   ```
3. `git status` pokazuje 3 zmienione pliki.
4. `git add 02-active-context/now.md 90-reference/session-log.md 40-runbooks/ecs-task-restart.md`
5. Commit:
   ```
   git commit -m "feat(aiops): runbook restartu ECS + analiza p95 load testu UAT"
   ```
6. Push:
   ```
   git push -u origin jgolab/2026-06-10
   ```

## Instrukcja MR wypisana operatorowi

```
glab mr create \
  --source-branch jgolab/2026-06-10 \
  --target-branch main \
  --title "feat(aiops): runbook restartu ECS + analiza p95" \
  --description "## Podsumowanie
Nowy runbook restartu zadania ECS i analiza degradacji p95 z load testu UAT.

## Zmiany
- 40-runbooks/ecs-task-restart.md (nowy)
- 20-projects/maspex-uat-loadtest.md (status)

## Domena
aiops

## Klasyfikacja / ekspozycja
internal; brak treści confidential/restricted; compliance review niewymagany.

## Ryzyko
Próg alarmu CloudWatch do weryfikacji w kolejnej sesji."
```
