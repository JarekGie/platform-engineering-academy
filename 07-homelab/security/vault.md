---
title: Homelab Security — Vault / OpenBao
vault_type: academy
domain: learning
classification: internal
llm_exposure: allowed_internal_only
notebooklm_source: false
podcast_export: forbidden
compliance_review: not_required
source_of_truth: true
created: 2026-07-12
updated: 2026-07-12
tags: [homelab, security, vault, openbao, secrets]
---

## Rola pliku

Środowisko treningowe zarządzania sekretami w homelabie. Jest źródłem dowodów praktycznych dla
modułu [[theory|secrets-management]] (`ev-secr-001`) — tu uruchamiamy Vault/OpenBao,
konfigurujemy dynamic secrets i politykę rotacji.

## Konfiguracja w homelabie

- Instancja Vault/OpenBao w homelabie (nie współdzielona z produkcją).
- Silniki: KV (sekrety statyczne treningowe), database (dynamic secrets z TTL).
- Polityki dostępu rozdzielone: odczyt sekretu vs zarządzanie politykami.

## Ćwiczenia

- Skonfiguruj dynamic DB secrets z leasingiem i wygaśnięciem.
- Zademonstruj rotację i unieważnienie poświadczenia; udokumentuj procedurę (nie wartości).

## Granica bezpieczeństwa

Wyłącznie sekrety treningowe. Żaden realny sekret/poświadczenie produkcyjne nie trafia do homelaba
ani do dowodu — dowodem jest konfiguracja i procedura, nie wartość sekretu.

## Powiązane

[[threat-model]], [[theory|secrets-management]].
