---
title: Standard review kodu labów (senior review)
vault_type: academy
domain: shared-concept
classification: public
llm_exposure: allowed
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-15
updated: 2026-07-15
tags: [standard, code-review, seniority, quality]
---

## Cel / kontekst

Definiuje, jak recenzowany jest kod labów i jak nazywany jest poziom pracy. Recenzentem bywa AI
lub człowiek; rola AI to **reviewer i asesor poziomu**, nie autor rozwiązania. Kod pisze operator.
Powiązane: [[lab-code-standard]], [[public-lab-security-standard]].

## Treść

### Co ocenia review (wymiary)
1. Poprawność (robi to, co deklaruje; `validate`/testy przechodzą).
2. Struktura i modularność.
3. Bezpieczeństwo (w tym public-safe wg [[public-lab-security-standard]]).
4. IAM least privilege.
5. Higiena stanu i sekretów (remote state z lockiem; brak state/tfvars/sekretów w repo).
6. Idempotencja (Ansible, powtarzalny apply).
7. Przypięcie wersji (providerzy, moduły, akcje, narzędzia).
8. Testy (validate/lint, molecule, pytest, go test).
9. CI/CD (fmt→validate→lint→security scan; OIDC zamiast kluczy).
10. Dokumentacja (README: uruchomienie, walidacja, teardown, koszt, ograniczenia).
11. Koszty (świadomość, oszacowanie, teardown).
12. Teardown (procedura + target `destroy`).
13. Zgodność kodu z deklarowanym rozumieniem operatora (czy autor rozumie, co napisał).

### Format findings (priorytety)
Każde ustalenie ma priorytet:
- **BLOCKER** — nie wolno mergować (sekret w repo, brak teardownu przy płatnych zasobach, IAM `*:*`).
- **HIGH** — poważny błąd/ryzyko do naprawy przed uznaniem laba za zrobiony.
- **MEDIUM** — istotne, ale nieblokujące; zaplanuj naprawę.
- **LOW** — drobne usprawnienie.
- **NIT** — kosmetyka/styl; opcjonalne.

### Struktura wyniku review
Review zwraca rozdzielnie:
- **findings** (lista wg priorytetów, każdy z uzasadnieniem i propozycją naprawy),
- **rekomendacje** (co poprawić i dlaczego),
- **pytania do autora** (gdy intencja niejasna),
- **ocena poziomu**: `junior | mid | senior | staff-like`,
- **warunki wejścia na kolejny poziom** (konkretne, mierzalne).

### Skala poziomu (kalibracja)
- **junior** — działa, ale copy-paste, hardcode, brak CI, ryzyko sekretów.
- **mid** — moduły, remote state, podstawowy CI, trochę lintowania.
- **senior** — DRY (Terragrunt gdy uzasadniony), least-priv IAM, security scan w CI, OIDC,
  przypięte wersje, testy, README z teardownem, świadomość kosztu, ADR na kompromisy.
- **staff-like** — wzorce reużywalne, policy-as-code (OPA/Sentinel), promocja multi-env,
  drift detection, DR, świadomie udokumentowane trade-offy.

### Czego reviewer (AI) NIE robi
- nie przepisuje całego rozwiązania bez wyraźnej prośby;
- nie maskuje braków operatora ani nie chwali na wyrost;
- nie ocenia seniority po liczbie plików ani długości kodu;
- nie wymyśla problemów bez dowodu; niepewność oznacza jako pytanie, nie jako finding.

## Uwagi

Ocena poziomu ma być **konstruktywna i kalibrowana**: nazywa poziom uczciwie i podaje najkrótszą
ścieżkę wyżej. Powiązane: [[lab-code-standard]], [[public-lab-security-standard]], [[decision-log]].
