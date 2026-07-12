## Cel
Kontrakt korzystania z ChatGPT jako narzędzia zewnętrznego względem vaulta. Określa, jaka treść może opuścić vault i jak wraca wynik.

## Zakres
Obowiązuje każde użycie ChatGPT (lub innego zewnętrznego asystenta przez przeglądarkę/API) na materiale pochodzącym z vaulta. Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Skąd ChatGPT czerpie treść
- ChatGPT konsumuje wyłącznie zawartość z `_chatgpt/context-packs/`.
- Nie wkleja się notatek bezpośrednio z vaulta — najpierw budowana jest paczka kontekstu (context-pack).

## Co może wejść do context-packa
- Tylko materiał z `llm_exposure: allowed` lub `allowed_anonymized`.
- `allowed_anonymized` wymaga wcześniejszej anonimizacji (patrz niżej i [[LLM_CONTEXT_BOUNDARY_CONTRACT]]).
- Nigdy nie wkleja się treści `classification: confidential` ani `restricted`.
- `allowed_internal_only` nie trafia do ChatGPT (narzędzie zewnętrzne).

## Reguły anonimizacji
Przed dodaniem `allowed_anonymized` do paczki:
- usuń nazwy klientów, osób, projektów objętych NDA;
- usuń identyfikatory środowisk, hosty, adresy, sekrety;
- zastąp dane stałymi placeholderami (np. `KLIENT_A`, `ENV_X`);
- jeśli po anonimizacji treść traci sens — nie eksportuj.

## Granice domen
Jedna paczka = jedna domena. Nie łącz domen w jednym context-packu (patrz [[DOMAIN_ISOLATION_CONTRACT]]).

## Powrót wyniku
Wynik z ChatGPT wraca do vaulta jako notatka zgodna z kontraktem notatki ([[AGENTS]]): po polsku, kebab-case, pełny frontmatter, `source_of_truth` pozostaje w vaultcie. Surowy wynik nie jest źródłem prawdy.

## Powiązane kontrakty
[[AGENTS]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[DOMAIN_ISOLATION_CONTRACT]], [[NOTEBOOKLM_CONTRACT]].

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
