<!-- Szablon README technicznego laba. To NIE jest notatka Obsidiana — nie dodawaj frontmattera vaulta.
     Ma być czytelny dla inżyniera/rekrutera bez znajomości vaulta. Public-safe (patrz
     30-standards/public-lab-security-standard.md). Usuń komentarze przed publikacją. -->

# <lab-id> — <tytuł laba>

> Lab edukacyjny. Kod powstaje iteracyjnie, **nie ma gwarancji gotowości produkcyjnej**.
> Tworzy zasoby chmurowe — wymagany świadomy **teardown**. Bez sekretów w repo.

## Cel
<Co lab demonstruje i jakiej kompetencji dowodzi.>

## Architektura
<Krótki opis komponentów i przepływów; szczegóły w architecture.md.>

## Wymagania
- <narzędzia + wersje, np. Terraform >= 1.9, konto chmurowe, uprawnienia>

## Uruchomienie
```bash
make fmt validate lint   # walidacja bez chmury
# make plan / apply — dopiero gdy istnieje kod i świadoma konfiguracja OIDC/dostępu
```

## Walidacja
<Jak potwierdzić sukces: obserwowalne kryterium, komendy, oczekiwany wynik.>

## Koszt
<Szacunek godzinowy/miesięczny; najdroższe zasoby. Szczegóły w cost.md.>

## Teardown
```bash
make destroy   # usuwa zasoby; potwierdź, że nic nie zostało (uniknięcie kosztów)
```

## Ograniczenia
<Czego lab świadomie nie robi; uproszczenia względem produkcji.>

## Bezpieczeństwo
- brak sekretów, kluczy, state i realnych identyfikatorów w repo (public-safe);
- wartości wrażliwe przez `*.tfvars.example` / `.env.example` z placeholderami;
- dostęp do chmury docelowo przez OIDC, bez długoterminowych kluczy.
