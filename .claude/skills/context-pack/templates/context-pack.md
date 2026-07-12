---
title: Context-pack — <temat>
vault_type: team
domain: internal-ops
classification: internal
llm_exposure: allowed
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: false
created: 2026-06-10
updated: 2026-06-10
tags: [chatgpt, context-pack]
---

Paczka kontekstu dla ChatGPT. Buduje ją [[context-pack]] wyłącznie z treści dopuszczonej
do narzędzia zewnętrznego (patrz [[CHATGPT]] i [[LLM_CONTEXT_BOUNDARY_CONTRACT]]).
`source_of_truth: false` — prawda zostaje w notatkach vaulta, nie tutaj.

## Cel paczki

<co ChatGPT ma zrobić z tym kontekstem — jedno-dwa zdania>

## Domena (jedna paczka = jedna domena)

`<client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd>`

## Materiały źródłowe (sprawdzone llm_exposure)

| Źródło | llm_exposure | status w paczce |
|---|---|---|
| [[<ścieżka/notatka>]] | `allowed` | włączone bez zmian |
| [[<ścieżka/notatka>]] | `allowed_anonymized` | włączone po anonimizacji |
| [[<ścieżka/notatka>]] | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |

## Kontekst

<streszczenie/wyciąg z dopuszczonych źródeł; `allowed_anonymized` już zanonimizowane:
placeholdery KLIENT_A, ENV_X zamiast nazw, hostów, sekretów>

## Pytania do ChatGPT

1. <konkretne pytanie>
2. <konkretne pytanie>

## Po powrocie wyniku

Wynik z ChatGPT wraca jako notatka vaulta zgodna z [[AGENTS]] (po polsku, kebab-case,
pełny frontmatter). Surowy wynik nie jest źródłem prawdy.
