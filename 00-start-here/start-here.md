---
title: Start here — platform-engineering-academy
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-12
tags:
  - start-here
  - onboarding
---

## Co to za vault
To vault typu **academy** o nazwie `platform-engineering-academy`, wlasciciel: Jarek.
Sluzy do operacyjnej pracy zespolu i jest source of truth dla swoich tematow.
Wszystkie notatki: po polsku, standalone, w kebab-case.

## Aktywna domena
Domyslna domena tego vaulta to **learning**.
Obslugiwane domeny: learning, shared-concept.
Zasada nadrzedna: **jedna sesja LLM = jedna domena**. Nie mieszaj w jednym
kontekscie danych z roznych domen (zobacz [[DOMAIN_ISOLATION_CONTRACT]]).

## Jak zaczac
1. Przeczytaj kontrakt agenta: [[AGENTS]] w `_system/`.
2. Otworz biezacy kontekst: [[now]] w `02-active-context/`.
3. Uruchom skill **start-day** (`.claude/skills/start-day`), aby rozpoczac sesje.
4. Nowe wejscia wrzucaj do `01-inbox/`, potem triażuj do wlasciwego katalogu.

## Gdzie sa kontrakty
Wszystkie kontrakty i polityki sa w `_system/`:
- [[AGENTS]] — czytaj jako pierwszy,
- [[CLAUDE]], [[CODEX]], [[CHATGPT]] — kontrakty narzedzi LLM,
- [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[DOMAIN_ISOLATION_CONTRACT]] — granice i izolacja,
- [[NOTEBOOKLM_CONTRACT]], [[PODCAST_EXPORT_POLICY]] — NotebookLM i podcasty,
- [[COMPLIANCE_REVIEW_CONTRACT]] — przeglad compliance.

## Zasada: jedna sesja = jedna domena
Trzymaj jedna domene wrazliwosci na sesje LLM. Dane klientowskie, dane osobowe,
strategia wewnetrzna, materialy compliance i prywatne R&D nie moga trafic do
wspolnego kontekstu. W razie watpliwosci — nie eksponuj i zapytaj wlasciciela vaulta.
