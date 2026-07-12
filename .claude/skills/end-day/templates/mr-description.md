# Szablon opisu MR (glab)

Komenda:

```
glab mr create \
  --source-branch <operator>/<YYYY-MM-DD> \
  --target-branch main \
  --title "<typ(zakres): tytuł>" \
  --description "$(cat <<'EOF'
## Podsumowanie
<1-2 zdania, co wnosi ta sesja>

## Zmiany
- <notatka / runbook / ADR>
- <...>

## Domena
<client-work | internal-ops | compliance | learning | aiops | shared-concept | private-rnd>

## Klasyfikacja / ekspozycja
Najwyższa klasyfikacja w tej sesji: <internal | confidential | ...>.
Czy coś wymaga compliance review przed eksportem: <tak/nie>.

## Ryzyko
<otwarte pytania, follow-upy, brak>
EOF
)"
```

Zasady:
- MR zawsze z brancha sesji do `main`;
- w opisie nie umieszczaj treści `restricted`/`confidential` — tylko fakt ich istnienia;
- jeśli sesja dotknęła notatek do compliance review, zaznacz to w sekcji Ryzyko.
