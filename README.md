# platform-engineering-academy

Vault Obsidian wygenerowany z obsidian-vault-framework (v0.6.0).

- **Typ:** academy
- **Wlasciciel:** Jarek
- **Utworzony:** 2026-07-12
- **Domyslna klasyfikacja:** internal

## Struktura
- `00-start-here/` — punkt wejscia, zacznij od [[start-here]].
- `01-inbox/` — surowe wejscia do triażu.
- `02-active-context/` — biezacy kontekst pracy ([[now]]).
- `10-areas/` — obszary odpowiedzialnosci.
- `20-projects/` — projekty.
- `30-standards/` — standardy.
- `40-runbooks/` — procedury operacyjne.
- `50-patterns/` — wzorce.
- `80-architecture/` — architektura i [[decision-log]].
- `90-reference/` — materialy referencyjne (w tym `notebooklm/`).
- `_system/` — kontrakty i polityki (patrz nizej).
- `_chatgpt/` — paczki kontekstu dla narzedzi zewnetrznych.
- `templates/` — szablony notatek.

## Kontrakty (_system/)
Przeczytaj przed praca z LLM:
- [[AGENTS]] — nadrzedny kontrakt agenta.
- [[CLAUDE]], [[CODEX]], [[CHATGPT]] — kontrakty narzedzi.
- [[DOMAIN_ISOLATION_CONTRACT]] — jedna sesja = jedna domena.
- [[LLM_CONTEXT_BOUNDARY_CONTRACT]] — granice ekspozycji LLM.
- [[NOTEBOOKLM_CONTRACT]], [[PODCAST_EXPORT_POLICY]] — NotebookLM i podcasty.
- [[COMPLIANCE_REVIEW_CONTRACT]] — przeglad compliance.

## Manifest
Tozsamosc i polityki vaulta: `vault-manifest.yaml`.
