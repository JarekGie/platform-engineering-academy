## Cel
Kontrakt specyficzny dla Claude Code pracującego w wygenerowanym vaultcie. Opisuje, jak Claude korzysta ze skilli, workflow dnia i reguł git.

## Zakres
Obowiązuje sesje Claude Code uruchomione w katalogu vaulta. Uzupełnia nadrzędny [[AGENTS]] — w razie sprzeczności wygrywa [[AGENTS]].

## Kolejność startowa
1. Claude czyta najpierw `_system/AGENTS.md` ([[AGENTS]]) — kontrakt notatki, frontmatter, granice domen.
2. Sprawdza aktywną domenę w `02-active-context/now.md`.
3. Dopiero potem czyta notatki — z poszanowaniem `llm_exposure` (patrz [[LLM_CONTEXT_BOUNDARY_CONTRACT]]).

## Skille (.claude/skills/)
- Claude używa wyłącznie skilli obecnych w `.claude/skills/` danego vaulta.
- Skill aktywuje się na podstawie intencji operatora; Claude nie wymyśla skilli spoza listy.
- Wynik działania skilla trafia do notatek vaulta, nie do narzędzi zewnętrznych.

## Workflow dnia
- `start-day` — odczyt `02-active-context/now.md`, deklaracja jednej aktywnej domeny, przegląd `01-inbox/`.
- `switch-project` — zamknięcie bieżącej domeny, zapis stanu, jawna zmiana domeny w `now.md`; nie wolno trzymać dwóch domen w jednym kontekście (patrz [[DOMAIN_ISOLATION_CONTRACT]]).
- `end-day` — porządkowanie inboxu, aktualizacja `updated:` w dotkniętych notatkach, commit.

## Ekspozycja LLM
Przed odczytem lub zacytowaniem dowolnej notatki Claude sprawdza `llm_exposure` we frontmatterze:
- `forbidden` — nie czyta i nie cytuje;
- `allowed_anonymized` — anonimizuje przed użyciem;
- `allowed_internal_only` — nie przekazuje do narzędzi zewnętrznych;
- `allowed` — używa w granicach domeny.

## Konwencja git
- Branch: `<operator>/<YYYY-MM-DD>` (np. `jgolab/2026-06-10`).
- Jeden branch na sesję/dzień; praca wielodomenowa rozbijana na osobne sesje.
- Commit lub push tylko na wyraźne polecenie operatora.

## Czego Claude NIE robi
- nie modyfikuje `_system/` bez zgody operatora;
- nie miesza domen w jednej sesji;
- nie eksportuje `restricted`/`confidential` poza vault.

## Powiązane kontrakty
[[AGENTS]], [[DOMAIN_ISOLATION_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[CODEX]], [[CHATGPT]].

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
