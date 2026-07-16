---
title: Rejestr decyzji academy (ADR)
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-15
tags: [architecture, adr, decision-log]
---

Chronologiczny rejestr decyzji dotyczących academy (ADR). Skill [[decision-note]] dopisuje nowe wpisy
na końcu w jednolitym formacie. Każdy wpis ma numer `ADR-NNNN`, status i uzasadnienie.
Nie usuwaj wpisów — decyzje wycofane oznacz statusem.

## Wpisy

### ADR-0001 — Prowadzić naukę jak pipeline kompetencji (evidence-first)

- Status: Zaakceptowana
- Kontekst: Nauka bywa konsumpcją materiału bez dowodu kompetencji; brakuje powtarzalnej drogi
  od teorii do dowodu i do rzeczywistego projektu.
- Decyzja: Prowadzić academy jako pipeline `Roadmap → Theory → Lab → Assessment → Homelab → Evidence
  → Real Project`, gdzie każdy moduł produkuje dowód ([[evidence-register]]).
- Konsekwencje: Kompetencje mają twarde pokrycie; Career OS może konsumować evidence przez federację
  (`source_system: academy`); homelab (trening) rozdzielony od real projects (rzeczywisty dowód).

### ADR-0002 — Napięcie: publiczne repo vs `classification: internal` / `llm_exposure: allowed_internal_only`

- Status: proponowana
- Data: 2026-07-15

**Kontekst** — Repo jest **publiczne** (`github.com/JarekGie/platform-engineering-academy`,
widoczność PUBLIC), a większość notatek ma `classification: internal` i
`llm_exposure: allowed_internal_only`. To napięcie ujawniło się przy dodaniu do vaulta uruchamialnego
kodu labów ([[lab-code-standard]]). `llm_exposure` bramkuje jedynie przekazywanie treści do narzędzi
LLM (np. ChatGPT/NotebookLM) — **nie cofa faktu publikacji**: wszystko śledzone w publicznym repo jest
de facto czytelne dla świata (ludzie, crawlery, trening modeli) i pozostaje w historii nawet po
usunięciu. Innymi słowy: po publikacji `classification`/`llm_exposure` **nie są granicą poufności**.

**Decyzja** — (proponowana, do potwierdzenia przez operatora):
1. Wszystko, co śledzone w tym publicznym repo, **musi być public-safe** — egzekwowane przez
   [[public-lab-security-standard]], `.gitignore`, `bin/validate-vault.sh` i CI `secret-scan`.
2. **Nie zmieniamy masowo** klasyfikacji istniejących notatek w tym kroku.
3. Zakładamy **osobne, późniejsze zadanie**: inwentaryzacja obecnych notatek `internal` —
   ustalenie, które są faktycznie public-safe (kandydaci do `public`), a które nie powinny być w
   publicznym repo. `_system/` nie jest edytowane w vaultcie (kopiowane z frameworka).
4. **Nie** stosujemy prywatnego brancha jako mechanizmu bezpieczeństwa (branch w publicznym repo nie
   jest granicą poufności). Jeśli potrzebna jest treść realnie niepubliczna — rozstrzyga to odrębna
   decyzja o miejscu jej przechowywania, poza zakresem tego ADR.

**Konsekwencje** — Pozytywne: jasna, egzekwowana granica „wszystko w repo = public-safe"; brak
złudnego poczucia ochrony z pól `classification`/`llm_exposure`. Negatywne / trudniejsze: pozostaje
rozjazd między etykietą `internal` a faktyczną jawnością (świadomy dług do zdjęcia w zadaniu
inwentaryzacyjnym); do jego rozstrzygnięcia część notatek nosi etykietę niespójną z rzeczywistą
ekspozycją. Status `proponowana` do czasu decyzji operatora o sposobie inwentaryzacji.
