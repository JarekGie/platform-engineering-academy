## Cel
Nadrzędny kontrakt dla każdego agenta LLM pracującego w wygenerowanym vaultcie. Definiuje kontrakt notatki, frontmatter, zasady bezpieczeństwa i granice działania.

## Zakres
Obowiązuje wszystkie narzędzia LLM: Claude Code ([[CLAUDE]]), Codex ([[CODEX]]), ChatGPT ([[CHATGPT]]), NotebookLM ([[NOTEBOOKLM_CONTRACT]]). Agent czyta ten plik jako pierwszy, przed jakąkolwiek operacją na vaultcie.

## Kontrakt notatki
Każda notatka operacyjna:
- po polsku, standalone (zrozumiała bez kontekstu zewnętrznego), bez pustych placeholderów;
- nazwa pliku w kebab-case; zakazane fragmenty nazw: `final`, `new`, `copy`, `v2`;
- powiązania przez [[wiki-links]], nie ścieżki względne;
- nie wymyślaj danych — jeśli czegoś brak, oznacz to wprost jako brak.

Struktura notatki operacyjnej:
```
## Objaw / problem
## Kontekst
## Działania / rozwiązanie
## Uwagi
```

## Frontmatter — blok minimum
Każda notatka operacyjna musi mieć kompletny blok:
```yaml
---
title:
vault_type:
domain:
classification:
llm_exposure:
notebooklm_source:
podcast_export:
compliance_review:
source_of_truth:
created:
updated:
tags:
---
```

Dozwolone wartości:
- `vault_type`: team | learning | client | aiops | compliance
- `classification`: public | internal | confidential | restricted
- `llm_exposure`: forbidden | allowed | allowed_anonymized | allowed_internal_only
- `notebooklm_source`: false | candidate | approved | rejected
- `podcast_export`: forbidden | allowed | allowed_after_review
- `compliance_review`: not_required | required | approved | rejected
- `domain`: client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd

## Klasyfikacja i ekspozycja LLM
Przed odczytaniem lub cytowaniem notatki agent sprawdza `llm_exposure`. Reguły wiążące opisuje [[LLM_CONTEXT_BOUNDARY_CONTRACT]]:
- `forbidden` — nigdy nie wchodzi do kontekstu LLM;
- `allowed_anonymized` — wymaga kroku anonimizacji przed użyciem;
- `allowed_internal_only` — bez narzędzi zewnętrznych (ChatGPT, NotebookLM);
- `allowed` — bez ograniczeń narzędziowych w ramach domeny.
`classification: restricted` oraz `confidential` (bez `compliance_review: approved`) nie opuszczają vaulta.

## Zasada bezpieczeństwa: jedna sesja LLM = jedna domena
W jednym kontekście nie wolno mieszać domen wrażliwości: danych klientowskich, danych personalnych, strategii wewnętrznej, materiałów compliance, prywatnego R&D. Aktywną domenę deklaruje się na starcie sesji w `02-active-context/now.md`. Szczegóły: [[DOMAIN_ISOLATION_CONTRACT]].

## Czego agent NIE robi
- nie miesza domen w jednej sesji;
- nie eksportuje notatek `restricted` ani `confidential` poza vault;
- nie modyfikuje `_system/` bez wyraźnej zgody operatora;
- nie wymyśla danych, źródeł ani liczb — przy braku danych pisze, że brakuje.

## Powiązane kontrakty
[[CLAUDE]], [[CODEX]], [[CHATGPT]], [[NOTEBOOKLM_CONTRACT]], [[PODCAST_EXPORT_POLICY]], [[COMPLIANCE_REVIEW_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[DOMAIN_ISOLATION_CONTRACT]].

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
