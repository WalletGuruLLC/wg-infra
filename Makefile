dev:
	terraform workspace select default
	terraform apply --var-file=dev.tfvars

qa:
	terraform workspace select qa
	terraform apply --var-file=qa.tfvars

stg:
	terraform workspace select stg
	terraform apply --var-file=stg.tfvars

prd:
	terraform workspace select prd
	terraform apply --var-file=prd.tfvars