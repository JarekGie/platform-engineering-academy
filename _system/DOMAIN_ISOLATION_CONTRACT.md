## Cel
Szczegółowo definiuje zasadę "jedna sesja LLM = jedna domena wrażliwości" oraz sposób deklarowania i rozdzielania domen.

## Zakres
Obowiązuje każdą sesję LLM w vaultcie (Claude, Codex, ChatGPT, NotebookLM). Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Domeny (7)
- `client-work` — praca dla klientów, dane i artefakty klientowskie.
- `internal-ops` — operacje wewnętrzne zespołu/DC.
- `compliance` — materiały i ustalenia compliance.
- `learning` — nauka, certyfikacje, materiały szkoleniowe.
- `aiops` — automatyzacja i operacje AI/infra.
- `shared-concept` — pojęcia ogólne, niewrażliwe, współdzielone.
- `private-rnd` — prywatne R&D, eksperymenty przed ujawnieniem.

## Reguła
Jedna sesja LLM operuje na dokładnie jednej domenie. W jednym kontekście nie wolno mieszać danych z różnych domen wrażliwości.

## Macierz: domeny, które nigdy nie współwystępują w jednej sesji
| | client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd |
|---|---|---|---|---|---|---|---|
| client-work | — | nie | nie | nie | nie | nie | nie |
| internal-ops | nie | — | nie | tak* | tak* | tak* | nie |
| compliance | nie | nie | — | nie | nie | nie | nie |
| learning | nie | tak* | nie | — | tak* | tak* | nie |
| aiops | nie | tak* | nie | tak* | — | tak* | nie |
| shared-concept | nie | tak* | nie | tak* | tak* | — | nie |
| private-rnd | nie | nie | nie | nie | nie | nie | — |

`nie` = zakaz współwystępowania w jednej sesji. `tak*` = dopuszczalne tylko gdy obie domeny są niewrażliwe i żaden materiał nie ma `classification: confidential`/`restricted`; w razie wątpliwości rozdziel sesje. `client-work`, `compliance` i `private-rnd` zawsze izolowane.

## Deklaracja aktywnej domeny
Na starcie sesji ustaw aktywną domenę w `02-active-context/now.md`, np.:
```yaml
active_domain: aiops
session_started: 2026-06-10
operator: jgolab
```
Materiał spoza zadeklarowanej domeny nie wchodzi do kontekstu.

## Praca obejmująca wiele domen
Rozbij na osobne sesje — po jednej na domenę. Między sesjami:
- zamknij kontekst poprzedniej domeny;
- zaktualizuj `now.md` na nową domenę;
- nie przenoś cytatów ani danych między domenami.

## Powiązane kontrakty
[[AGENTS]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[CLAUDE]], [[CODEX]], [[CHATGPT]].
