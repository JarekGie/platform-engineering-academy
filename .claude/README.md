# .claude

Katalog konfiguracji Claude Code dla tego vaulta. Podkatalog `skills/` jest WYPEŁNIANY przez
generator (`bin/new-vault.sh`), który kopiuje skille z `skills/` repozytorium frameworka
(m.in. start-day, end-day, switch-project, decision-note, incident-note, context-pack, notebooklm-export).

Ten vault (`academy`) ma dodatkowo **skille Academy OS** (Academy Learning Engine, framework 0.7.0):
- `academy-coach` — onboarding, adaptacyjny assessment, adaptive roadmap, checkpointy, reassessment,
  `status` (komendy: `początek`, `status`, `checkpoint`, `reassessment`, `co dalej`),
- `academy-podcasts` — NotebookLM Learning Engine (`podcast`, `następny podcast`),
- `academy-learning-loop` — pętla Podcast → Theory → Lab → Assessment → Evidence
  (`skończyłem podcast`, `następny lab`, `następny moduł`).

Co tu trafia:
- `skills/` z kontekstowymi skillami (shared kopiowane przez generator + academy-skille Academy OS),
- lokalna konfiguracja Claude Code dla vaulta,
- nie edytuj kopii skilli shared ręcznie — zmieniaj źródła we frameworku.
