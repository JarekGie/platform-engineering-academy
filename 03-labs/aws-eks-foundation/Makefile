# Makefile — lab aws-eks-foundation. Wspólny interfejs operatora.
# BEZ ATRAP: targety operujące na kodzie wymagają istnienia plików .tf w $(INFRA_DIR).
# Dopóki kodu nie ma, kończą się jawnym komunikatem i kodem != 0 (nie fałszywym sukcesem).

INFRA_DIR := infra/terraform
TF_FILES  := $(wildcard $(INFRA_DIR)/*.tf)

.DEFAULT_GOAL := help
.PHONY: help guard-tf fmt validate lint security plan apply destroy

help: ## Pokaż dostępne targety
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN{FS=":.*?## "}{printf "  %-10s %s\n", $$1, $$2}'

guard-tf:
	@if [ -z "$(TF_FILES)" ]; then \
	  echo "GAP: brak plików .tf w $(INFRA_DIR) — napisz kod Terraform przed uruchomieniem tego targetu."; \
	  echo "     Szkielet laba celowo nie zawiera .tf (patrz $(INFRA_DIR)/README.md)."; \
	  exit 1; \
	fi

fmt: guard-tf ## terraform fmt (check, rekursywnie)
	terraform -chdir=$(INFRA_DIR) fmt -check -recursive

validate: guard-tf ## terraform init -backend=false + validate
	terraform -chdir=$(INFRA_DIR) init -backend=false -input=false
	terraform -chdir=$(INFRA_DIR) validate

lint: guard-tf ## tflint
	cd $(INFRA_DIR) && tflint --no-color

security: guard-tf ## checkov (security scan)
	checkov -d $(INFRA_DIR) --quiet

plan apply destroy: guard-tf ## poza zakresem szkieletu (wymaga kodu + świadomej konfiguracji OIDC/dostępu)
	@echo "GAP: '$@' wymaga realnego kodu Terraform oraz dostępu do AWS przez OIDC."
	@echo "     Na etapie szkieletu plan/apply/destroy sa celowo poza zakresem (patrz README.md)."
	@exit 1
