# MANDATORY_WORKFLOW_CONTRACT

## Cel
Zagwarantować deterministyczne działanie agentów: skill jest **kontraktem wykonawczym**,
a nie sugestią. Pominięcie obowiązkowego skilla to **naruszenie kontraktu**, nie drobiazg.

## Zakres
Dotyczy każdego agenta LLM pracującego w vaultcie (Claude, Codex, ChatGPT, inne) oraz
wszystkich skilli w `.claude/skills/`. To nadrzędna warstwa governance — **Mandatory Workflow
Enforcement Layer** — spięta z [[AGENTS]], walidatorem (`bin/validate-vault.sh`) i metadanymi skilli.

---

## Zasada nadrzędna

```text
Skills are executable contracts.

Mandatory skills must always be executed.

Skipping a mandatory skill is a contract violation.
```

Jeżeli agent może samodzielnie zdecydować o pominięciu kroku opisanego w skillu, cały model
governance przestaje być wiarygodny. Dlatego decyzja „pomińmy ten krok" jest **niedozwolona**.

---

## Zachowania zakazane

Agent **nie może**:

- pomijać kroku obowiązkowego skilla,
- wykonywać tylko części obowiązkowego skilla,
- zastępować skilla własnym, ad-hoc workflow,
- wykonywać workaround bez kontraktu na taki workaround,
- tłumaczyć pominięcia pamięcią, nieuwagą lub „prostotą zadania".

Skill `mandatory: true` z `allow_workaround: false` **musi** zostać wykonany w całości, zanim
agent przejdzie dalej. Brak możliwości wykonania → patrz Contract Violation Protocol.

---

## Contract Violation Protocol

Gdy agent wykryje, że pominął obowiązkowy skill/krok (albo nie jest w stanie go wykonać),
**zatrzymuje się** i zwraca dokładnie ten format — i nic poza nim w roli usprawiedliwienia:

```text
CONTRACT VIOLATION

missed_required_skill: <nazwa skilla lub "n/a">
missed_required_step: <pominięty krok>
affected_workflow: <workflow / skill, którego dotyczy>
risk: <co może być błędne z tego powodu>
recovery_action: <dokładna następna akcja naprawcza>
status: <detected | blocked_until_recovered | recovered>
```

Dozwolone statusy:

```yaml
status:
  - detected                 # wykryto naruszenie
  - blocked_until_recovered  # praca wstrzymana do naprawy
  - recovered                # naprawione (recovery_action wykonane)
```

Po zgłoszeniu naruszenia agent **wykonuje** `recovery_action` — nie poprzestaje na deklaracji.

---

## Zakazane komunikaty (maskujące błąd procesu)

Następujące komunikaty są **zakazane**, bo ukrywają naruszenie kontraktu za uprzejmością:

```text
I forgot
I ignored
I overlooked
I'll remember next time
I'll save it permanently
```

Każdy taki komunikat jest **symptomem naruszenia kontraktu**. W ich miejsce agent używa
wyłącznie bloku `CONTRACT VIOLATION` powyżej.

---

## Metadane skilla (frontmatter)

Każdy skill deklaruje swój status w nagłówku `SKILL.md`:

```yaml
---
skill_name: <nazwa>
mandatory: <true | false>
enforcement: <hard | soft>
allow_workaround: <true | false>
on_failure: <stop_and_report_contract_violation | warn | continue>
---
```

Znaczenie pól:

| Pole | Znaczenie |
|---|---|
| `mandatory` | `true` = skill musi zostać wykonany, gdy jego trigger zachodzi |
| `enforcement` | `hard` = brak wykonania to naruszenie kontraktu; `soft` = ostrzeżenie |
| `allow_workaround` | `false` = brak dozwolonych obejść bez osobnego kontraktu |
| `on_failure` | reakcja na niepowodzenie; dla skilli operacyjnych: `stop_and_report_contract_violation` |

---

## Klasyfikacja skilli

### Informational (`mandatory: false`)
Pomocnicze, bez skutków ubocznych. Przykłady: `show-help`, `list-projects`, `status`.
Pominięcie nie jest naruszeniem.

### Operational (`mandatory: true`, `enforcement: hard`, `allow_workaround: false`)
Zmieniają stan vaulta lub bramkują proces. Wykonanie obowiązkowe.
Bieżące skille operacyjne: `start-day`, `end-day`, `switch-project`, `context-pack`,
`notebooklm-export`, `incident-note`, `decision-note`.

---

## Egzekwowanie

- Walidator `bin/validate-vault.sh` sprawdza obecność tego kontraktu, jego referencje w
  kontraktach agentów oraz kompletność metadanych skilli (`mandatory`, `enforcement`, `on_failure`).
- Kontrakty agentów ([[AGENTS]], [[CLAUDE]], [[CODEX]], [[CHATGPT]]) odsyłają do tej warstwy w
  sekcji „Mandatory Workflow Enforcement".
- Powiązane: [[DOMAIN_ISOLATION_CONTRACT]], [[LLM_CONTEXT_BOUNDARY_CONTRACT]], [[COMPLIANCE_REVIEW_CONTRACT]].
