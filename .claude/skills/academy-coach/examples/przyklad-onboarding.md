# Przykład — przebieg onboardingu (academy-coach)

Skrót realnej sesji `początek`. Pytania padają **pojedynczo**, nie jako ankieta.

```
Trener: Pracowałeś produkcyjnie z AWS?
User:   Tak
Trener: Jak długo?
User:   5+ lat
Trener: A z Kubernetes na produkcji?
User:   Tak, jestem ownerem klastrów
...
```

Ponieważ AWS = 5+ lat i Kubernetes = owner, Etap 3 pomija pytania definicyjne i przechodzi do
architektonicznych:

```
Trener: Masz SCP blokujące us-east-1. Jak wdrożysz Security Hub dla organizacji?
User:   Delegated administrator + agregacja regionalna, wykluczam zablokowany region z home region...
```

Kalibracja (Etap 4) daje np.:

| Filar | Poziom |
| --- | --- |
| Cloud | 4 Advanced Senior |
| Platform | 3 Senior |
| Kubernetes | 4 Advanced Senior |
| GitOps | 3 Senior |
| Security | 2 Mid |
| AI | 1 Junior |
| FinOps | 1 Junior |

Cel (Etap 5): „Security Platform Engineer". Największa luka: Security (2 → 4) i AI (1 → 3).
Etap 6 generuje `adaptive-roadmap.md`, a stan trafia do `academy-state.md`
(`active_pillar: Security`, `next_action: moduł cloud-security`).
