---
title: Context-pack — onboarding nowego inżyniera DC
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
tags: [chatgpt, context-pack, internal-ops]
---

Przykładowa, zbudowana paczka kontekstu na temat z domeny `internal-ops`. Pokazuje, jak
[[context-pack]] bramkuje źródła i anonimizuje `allowed_anonymized` przed eksportem do ChatGPT.

## Cel paczki

Poproś ChatGPT o draft listy kontrolnej onboardingu nowego inżyniera DC na podstawie
naszych obecnych standardów i runbooków.

## Domena (jedna paczka = jedna domena)

`internal-ops`

## Materiały źródłowe (sprawdzone llm_exposure)

| Źródło | llm_exposure | status w paczce |
|---|---|---|
| [[30-standards/onboarding-standard]] | `allowed` | włączone bez zmian |
| [[40-runbooks/dostep-do-repozytoriow]] | `allowed_anonymized` | włączone po anonimizacji (nazwy hostów → ENV_X) |
| [[40-runbooks/rotacja-kluczy-ssh]] | `allowed_internal_only` | POMINIĘTE — narzędzie zewnętrzne |
| [[20-projects/klient-a-migracja]] | `confidential` | POMINIĘTE — brak compliance approve |

## Kontekst

Standard onboardingu obejmuje: założenie konta, dostęp do repozytoriów, przegląd
kontraktów notatki, pierwszą sesję `start-day`. Dostęp do repozytoriów realizujemy przez
konto serwisowe i klucz wdrażany do środowiska ENV_X (host i nazwa konta zanonimizowane).
Rotacja kluczy SSH i szczegóły projektu KLIENT_A celowo pominięte — nie wychodzą do ChatGPT.

## Pytania do ChatGPT

1. Zaproponuj listę kontrolną onboardingu w 5 sekcjach na podstawie powyższego.
2. Wskaż kroki, których typowo brakuje w onboardingu zespołów DevOps.

## Po powrocie wyniku

Draft od ChatGPT wraca jako notatka `30-standards/onboarding-checklist.md` zgodna z [[AGENTS]],
po weryfikacji u właściciela standardu. Ta paczka nie jest źródłem prawdy.

## Raport skilla (wypisany operatorowi)

```
Temat: onboarding nowego inżyniera DC
Domena: internal-ops
Źródła włączone: 2 (1x allowed, 1x allowed_anonymized)
Źródła pominięte: 2
  - 40-runbooks/rotacja-kluczy-ssh — allowed_internal_only (narzędzie zewnętrzne)
  - 20-projects/klient-a-migracja — confidential bez compliance approve
```
