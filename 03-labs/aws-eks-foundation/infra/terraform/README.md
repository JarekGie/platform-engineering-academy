# infra/terraform — aws-eks-foundation

> **Szkielet.** Ten katalog celowo **nie zawiera plików `.tf`**. Operator pisze kod iteracyjnie.
> Poniżej wyłącznie **planowana** zawartość i zasady. Kod musi być public-safe (bez sekretów,
> state, realnych account ID) — patrz `../../../30-standards/public-lab-security-standard.md`.

## Planowana zawartość

- **provider configuration** — provider AWS z **przypiętą wersją**; region jako zmienna.
- **networking** — VPC + subnety (publiczne/prywatne) pod klaster.
- **EKS control plane** — zasób klastra EKS z least-privilege IAM.
- **managed node group** — węzły robocze (typ i rozmiar jako zmienne).
- **outputs** — nazwa klastra, endpoint (bez wartości wrażliwych).

## Zasady (obowiązują, gdy powstanie kod)

- wersje providerów przypięte; `.terraform.lock.hcl` **śledzony** w repo;
- backend **bez** wpisanych na sztywno danych środowiskowych;
- brak sekretów w `variables`, brak realnych identyfikatorów kont;
- zasoby otagowane; teardown udokumentowany (README laba + `make destroy`).

## Przyszłe kroki (poza szkieletem)

- **remote state** (np. S3 + DynamoDB lock) — świadoma decyzja + ADR w
  `../../../80-architecture/decision-log.md`;
- **testy** — `terraform validate`, `tflint`, security scan (CI); dalej ewentualnie terratest;
- **plan/apply** — dopiero z dostępem przez **OIDC**, nigdy z długoterminowymi kluczami.

## Walidacja lokalna (gdy pojawią się pliki `.tf`)

```bash
# z katalogu laba (03-labs/aws-eks-foundation/):
make fmt validate lint
```
