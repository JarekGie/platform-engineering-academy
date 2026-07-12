## Cel
Określa, jak wartość `llm_exposure` notatki bramkuje to, co może trafić do okna kontekstu LLM i jakie operacje są dozwolone.

## Zakres
Obowiązuje wszystkie narzędzia LLM (Claude, Codex, ChatGPT, NotebookLM) przed dodaniem jakiejkolwiek notatki do kontekstu. Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Reguła nadrzędna
Przed dodaniem notatki do kontekstu sprawdź jej `llm_exposure`. Jeśli pole brakuje lub jest niejasne — traktuj jak `forbidden` i nie dodawaj.

## Tabela dozwolonych operacji
| llm_exposure | read | quote | summarize | export (zewn.) |
|---|---|---|---|---|
| `forbidden` | nie | nie | nie | nie |
| `allowed_internal_only` | tak | tak | tak | nie (bez ChatGPT/NotebookLM) |
| `allowed_anonymized` | tak, po anonimizacji | tak, po anonimizacji | tak, po anonimizacji | tak, tylko zanonimizowane |
| `allowed` | tak | tak | tak | tak (w granicach domeny i compliance) |

## Reguły szczegółowe
- `forbidden` — nigdy nie wchodzi do kontekstu LLM, w żadnej operacji.
- `allowed_anonymized` — wymaga kroku anonimizacji przed użyciem (usunięcie nazw klientów, osób, hostów, sekretów; patrz [[CHATGPT]]).
- `allowed_internal_only` — dozwolone tylko narzędzia wewnętrzne (Claude Code, Codex); zakazane narzędzia zewnętrzne (ChatGPT, NotebookLM).
- `allowed` — bez ograniczeń narzędziowych, ale nadal w granicach jednej domeny ([[DOMAIN_ISOLATION_CONTRACT]]) i zasad eksportu/compliance.

## Współgranie z klasyfikacją
`llm_exposure` nie nadpisuje `classification`. Niezależnie od ekspozycji `restricted` nie opuszcza vaulta, a `confidential` wymaga `compliance_review: approved` przed eksportem (patrz [[COMPLIANCE_REVIEW_CONTRACT]]).

## Powiązane kontrakty
[[AGENTS]], [[DOMAIN_ISOLATION_CONTRACT]], [[CHATGPT]], [[NOTEBOOKLM_CONTRACT]], [[COMPLIANCE_REVIEW_CONTRACT]].
