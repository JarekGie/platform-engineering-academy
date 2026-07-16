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

## Kod labow (monorepo)
To repo jest **monorepo** i **publiczna wizytowka**: laczy wiedze, decyzje, implementacje i dowody.
Oprocz notatek laby moga zawierac **uruchamialny kod** (Terraform, Terragrunt, Ansible, Kubernetes,
Helm, Bash, opcjonalnie Python/Go) oraz CI/CD walidujace ten kod. Kod labow jest **czescia procesu
nauki, nie produkcyjnym frameworkiem**.

- **Gdzie:** kazdy lab z kodem to katalog `03-labs/<lab-id>/` (np. `03-labs/aws-eks-foundation/`)
  z `README.md`, `lab.md`, `evidence.md`, `Makefile` oraz `infra/`, `platform/`, `apps/` wg potrzeb.
  Laby sprzed tej zmiany pozostaja plaskimi notatkami `03-labs/lab-*.md` (model grandfathered).
- **Jak dodac nowy lab:** skrob z szablonow `templates/lab*.md` + `templates/lab-readme.md`;
  standard: [[lab-code-standard]].
- **Walidacja:** `bin/validate-vault.sh` (frontmatter, wiki-links, artefakty) + CI w `.github/workflows/`
  (`docs`, `secret-scan`, `terraform`). CI jest filtrowane sciezkami; `docs` waliduje tylko zmienione pliki.
- **Terraform teraz, Terragrunt pozniej:** zaczynamy od prostego Terraform; Terragrunt dopiero przy
  realnej potrzebie (wiele srodowisk, duplikacja) — jako udokumentowana decyzja.
- **Bezpieczenstwo publicznego repo:** zadnych sekretow, state, kubeconfigow, kluczy ani realnych
  identyfikatorow — wszystko public-safe: [[public-lab-security-standard]].

## Manifest
Tozsamosc i polityki vaulta: `vault-manifest.yaml`.
