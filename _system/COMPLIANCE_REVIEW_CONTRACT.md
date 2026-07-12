## Cel
Proces przeglądu compliance dla materiałów przeznaczonych do eksportu lub publikacji (synteza, podcast, paczki kontekstu). Definiuje etapy, checklistę i mapowanie na frontmatter.

## Zakres
Obowiązuje każdy materiał, którego frontmatter ma `compliance_review: required` lub który ma opuścić zespół. Uzupełnia [[AGENTS]]; w razie sprzeczności wygrywa [[AGENTS]].

## Proces
1. `draft` — materiał powstaje w vaultcie/artefaktach.
2. `review requested` — autor zgłasza do compliance; ustawia `compliance_review: required`.
3. `reviewed` — compliance ocenia wg checklisty poniżej.
4. `approved` lub `rejected` — decyzja zapisana przy materiale.
5. `published` lub `internal-only` — sposób udostępnienia po akceptacji.

## Checklista compliance
- [ ] Czy materiał zawiera dane klienta?
- [ ] Czy zawiera dane osobowe?
- [ ] Czy zawiera sekrety (klucze, hasła, tokeny, hosty)?
- [ ] Czy ujawnia architekturę bezpieczeństwa?
- [ ] Czy zawiera informacje kontraktowe?
- [ ] Czy może być udostępniony poza zespołem?
- [ ] Czy wymaga anonimizacji (patrz [[CHATGPT]] / [[LLM_CONTEXT_BOUNDARY_CONTRACT]])?

Dowolna odpowiedź "tak" w punktach 1-5 bez mitygacji oznacza `rejected` albo wymóg anonimizacji przed ponownym zgłoszeniem.

## Mapowanie na frontmatter
- Zgłoszenie do przeglądu → `compliance_review: required`.
- Akceptacja → `compliance_review: approved`.
- Odrzucenie → `compliance_review: rejected`.
- Materiał, który przeglądu nie wymaga → `compliance_review: not_required`.

Decyzja `approved` jest warunkiem koniecznym eksportu `allowed_after_review` (patrz [[PODCAST_EXPORT_POLICY]]) i zatwierdzania źródeł NotebookLM (patrz [[NOTEBOOKLM_CONTRACT]]).

## Powiązane kontrakty
[[AGENTS]], [[PODCAST_EXPORT_POLICY]], [[NOTEBOOKLM_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[CHATGPT]].
