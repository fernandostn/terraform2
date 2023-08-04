# import env config
cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# variables definitions
TERRAFORM_VERSION=light

terraform-init:
	docker run --rm -v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh -w /app/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) init --reconfigure

terraform-plan:
	docker run --rm -v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh -w /app/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) plan -out=tfplan

terraform-apply:
	docker run --rm -v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh -w /app/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) apply tfplan

terraform-destroy:
	docker run --rm -v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh -w /app/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) destroy -auto-approve

terraform-bash:
	docker run --rm -v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh -w /app/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY --entrypoint "" hashicorp/terraform:$(TERRAFORM_VERSION) sh