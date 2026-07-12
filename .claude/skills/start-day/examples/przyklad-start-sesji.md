# Przykład: start sesji ("lecimy")

Operator pisze do Claude: **„lecimy, dziś robimy aiops"**.

## Co robi skill

1. Czyta `_system/AGENTS.md` i `_system/CLAUDE.md`.
2. `git status` — czysto, brak niezacommitowanych zmian.
3. `git checkout main && git pull --ff-only` — main zsynchronizowany.
4. Operator z `git config user.email` = `jgolab`, data = `2026-06-10`.
5. `git checkout -b jgolab/2026-06-10`.
6. Aktywna domena podana wprost: `aiops`.
7. Aktualizacja `02-active-context/now.md` (z szablonu `now-snapshot.md`).

## Wynikowy `02-active-context/now.md` (fragment)

```markdown
## Aktywny operator
Jarek Gołąb — DevOps / AIOps

## Aktywna domena (jedna sesja = jedna domena)
`aiops`

## Bieżący kontekst
Projekt [[20-projects/maspex-uat-loadtest]], runbook [[40-runbooks/ecs-task-restart]].

## Następny krok
Przeanalizować degradację p95 z ostatniego load testu UAT.

## Branch sesji
`jgolab/2026-06-10`
```

## Podsumowanie wypisane operatorowi

```
Branch: jgolab/2026-06-10 (z main, ff-only)
Operator: Jarek Gołąb
Aktywna domena: aiops
01-inbox: 2 pozycje aiops do rozpracowania
Następny krok: analiza degradacji p95 (load test UAT)
```
