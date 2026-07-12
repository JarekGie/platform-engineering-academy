# Przykład: przełączenie projektu

Operator: **„przełącz na puzzler-b2b"**. Bieżąca domena w `now.md`: `aiops`.

## Co robi skill

1. Czyta `_system/AGENTS.md` i `now.md` (aktywna domena: aiops).
2. Znajduje `20-projects/puzzler-b2b.md` (manifest).
3. Wczytuje manifest: domena `client-work`, cel = jumphost do DocumentDB przez ECS Fargate.
4. **Wykrywa zmianę domeny**: aiops → client-work. Ostrzega operatora:

   ```
   UWAGA: zmiana domeny aiops -> client-work.
   Jedna sesja = jedna domena. Zapisz stan bieżącej sesji (end-day / log),
   zanim przełączę kontekst. Potwierdź zmianę.
   ```
5. Po potwierdzeniu aktualizuje `now.md`:

   ```markdown
   ## Aktywny operator
   Jarek Gołąb — DevOps

   ## Aktywna domena (jedna sesja = jedna domena)
   `client-work`

   ## Bieżący kontekst
   Projekt [[20-projects/puzzler-b2b]] — jumphost DocumentDB (ECS Fargate).
   Runbook [[40-runbooks/puzzler-b2b-jumphost]].

   ## Następny krok
   Rotacja klucza SSH jumphosta i test tunelu.
   ```

## Kontekst pokazany operatorowi

```
Projekt: puzzler-b2b (client-work)
Status: aktywny
Następny krok: rotacja klucza SSH + test tunelu SSH do DocumentDB
Otwarte: weryfikacja wiringu Terraform po rotacji
```
