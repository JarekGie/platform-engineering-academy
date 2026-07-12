# Szablon commita (conventional commits)

Format:

```
<typ>(<zakres>): <opis w trybie dokonanym, po polsku>

<opcjonalne ciało: co i dlaczego>
```

Dozwolone typy: `feat`, `fix`, `docs`, `refactor`, `chore`.
Zakres = aktywna domena lub obszar (np. `aiops`, `compliance`, `internal-ops`, `runbooks`).

Przykłady:

```
feat(aiops): dodaj runbook restartu zadania ECS
docs(compliance): zaktualizuj rejestr źródeł NotebookLM
fix(runbooks): popraw kryterium sukcesu w runbooku jumphost
chore(internal-ops): aktualizacja now.md po sesji 2026-06-10
```

Zasady:
- jedna domena na commit (jedna sesja = jedna domena);
- opis krótki, imperatyw/dokonany, po polsku;
- nie wpisuj danych klientowskich ani sekretów do treści commita.
