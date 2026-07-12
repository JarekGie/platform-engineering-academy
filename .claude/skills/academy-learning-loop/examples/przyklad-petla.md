# Przykład — pętla po podcaście (academy-learning-loop)

```
User:  skończyłem podcast
Skill: Jakie 3 rzeczy zapamiętałeś?
User:  1) delegated admin dla Security Hub, 2) agregacja regionalna, 3) home region a SCP
Skill: Jak oceniasz zrozumienie? (1–5)
User:  3
Skill: Ocena 3 → czas na praktykę. Proponuję lab z modułu cloud-security.
       Ustawiam next_action: lab-csec-guardduty-securityhub. Lab kończy się ev-csec-001.
```

Następnie:

```
User:  następny lab
Skill: [[03-labs]] → lab-csec-guardduty-securityhub (powiązany z active_module: cloud-security).
       Po zaliczeniu zarejestruj ev-csec-001 w [[evidence-register]].
```

Pętla domknięta dopiero, gdy lab wyprodukuje dowód. `academy-state.md` dostaje nowy `next_action`.
