# aws-eks-foundation — fundament klastra EKS (lab edukacyjny)

> **Lab edukacyjny.** Kod powstaje iteracyjnie i **nie ma gwarancji gotowości produkcyjnej**.
> Lab tworzy zasoby AWS, które **generują koszty** — wymagany świadomy **teardown**.
> Repo jest publiczne: **bez sekretów, kluczy, state i realnych identyfikatorów** (patrz
> `../../30-standards/public-lab-security-standard.md`).
>
> Status: **szkielet** — na tym etapie repo **nie zawiera kodu Terraform**. Operator dopisze `.tf`
> samodzielnie, iteracyjnie. Planowaną zawartość opisuje `infra/terraform/README.md`.

## Cel
Zbudować minimalny, czytelny fundament klastra Amazon EKS w Terraform i dowieść kompetencji
„provisioning + walidacja klastra zarządzanego". Domyka krok pipeline `Lab → Implementation →
Validation → Evidence` dla modułu `kubernetes`.

## Architektura
Docelowo: sieć (VPC + subnety), control plane EKS, managed node group, outputs. Szczegóły i
diagram: `architecture.md`. (Na etapie szkieletu — opis planu, bez implementacji.)

## Wymagania
- Terraform (wersja przypięta w kodzie, gdy powstanie; CI zakłada `1.9.x`).
- Konto AWS z uprawnieniami do VPC/EKS/IAM (do przyszłego `apply` — poza zakresem szkieletu).
- `kubectl` do walidacji klastra (gdy klaster powstanie).

## Uruchomienie
```bash
make help                 # lista targetów
make fmt validate lint    # walidacja kodu BEZ chmury (dostępna, gdy istnieją pliki .tf)
# make plan / apply       # celowo poza zakresem szkieletu (wymaga kodu + OIDC/dostępu)
```

## Walidacja
Docelowe kryterium sukcesu: klaster odpowiada, węzły `Ready`:
```bash
kubectl get nodes -o wide   # oczekiwane: węzły w stanie Ready
```
Na etapie szkieletu walidacja ogranicza się do statyczne­j walidacji kodu (gdy `.tf` powstaną).

## Koszt
EKS control plane i node group są płatne godzinowo. Szacunki i najdroższe zasoby: `cost.md`.
**Zawsze rób teardown po labie.**

## Teardown
```bash
make destroy   # usuwa zasoby (dostępne dopiero z realnym kodem i świadomą konfiguracją)
```

## Ograniczenia
- to nie jest architektura produkcyjna (brak multi-AZ hardeningu, WAF, pełnej observability itd.);
- brak `terraform plan`/apply w CI; dostęp do AWS docelowo przez OIDC, nie przez klucze.

## Bezpieczeństwo
- brak sekretów/kluczy/state/realnych account ID w repo (public-safe);
- wartości wrażliwe wyłącznie przez `*.tfvars.example` z placeholderami;
- skan sekretów (gitleaks) w CI, blocking.
