## Cel
Kontrakt korzystania z Codex i innych agentów kodujących w wygenerowanym vaultcie. Ogranicza działanie do kodu i runbooków w dozwolonych domenach.

## Zakres
Obowiązuje każdą sesję agenta kodującego operującego na materiale z vaulta. Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Co Codex może
- Operuje wyłącznie na kodzie i runbookach (`40-runbooks/`, `50-patterns/`, fragmenty kodu w notatkach) w dozwolonych domenach: `internal-ops`, `aiops`, `learning`, `shared-concept`.
- Generuje, refaktoruje i wyjaśnia kod oraz procedury operacyjne.
- Pracuje w granicach jednej aktywnej domeny zadeklarowanej w `02-active-context/now.md`.

## Czego Codex NIE robi
- nie wciąga do kontekstu notatek z domeny `client-work` ani materiałów `classification: restricted`;
- nie miesza domen — respektuje [[DOMAIN_ISOLATION_CONTRACT]];
- nie korzysta z notatek o `llm_exposure: forbidden`; `allowed_anonymized` wymaga uprzedniej anonimizacji (patrz [[LLM_CONTEXT_BOUNDARY_CONTRACT]]);
- nie wysyła treści vaulta do usług zewnętrznych poza zatwierdzonym kanałem.

## Wyjście
Wynik pracy (kod, poprawiony runbook, opis rozwiązania) trafia do notatek vaulta zgodnie z kontraktem notatki ([[AGENTS]]), a nie do usług zewnętrznych. Każda zmieniona notatka aktualizuje pole `updated:`.

## Sprawdzenie przed startem
1. Odczytaj aktywną domenę w `now.md`.
2. Potwierdź, że materiał wejściowy mieści się w dozwolonych domenach i ma dopuszczalne `llm_exposure`.
3. Jeśli zadanie wykracza poza jedną domenę — rozbij na osobne sesje.

## Powiązane kontrakty
[[AGENTS]], [[DOMAIN_ISOLATION_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[CLAUDE]].

## Mandatory Workflow Enforcement

Skille to **kontrakty wykonawcze**, nie sugestie. Agent **musi wykonać wszystkie obowiązkowe
kroki workflow, zanim przejdzie dalej**. Pominięcie obowiązkowego skilla (`mandatory: true`,
`enforcement: hard`) to **naruszenie kontraktu**. Pełna definicja: [[MANDATORY_WORKFLOW_CONTRACT]].

Zakazane są komunikaty maskujące błąd procesu: „I forgot", „I ignored", „I overlooked",
„I'll remember next time", „I'll save it permanently". Zamiast nich agent zgłasza naruszenie
w formacie:

```text
CONTRACT VIOLATION

missed_required_skill: <nazwa skilla lub "n/a">
missed_required_step: <pominięty krok>
affected_workflow: <workflow / skill>
risk: <co może być błędne z tego powodu>
recovery_action: <dokładna następna akcja>
status: <detected | blocked_until_recovered | recovered>
```

a następnie wykonuje `recovery_action`.
