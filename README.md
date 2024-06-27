# Terraform & GCP

## Install Terraform

<https://developer.hashicorp.com/terraform/install?product_intent=terraform>

```sh
terraform version
```

## Terraform Documentation

Main documentation <https://registry.terraform.io/>

Local provider <https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file>
Random provider <https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string>
GCP Provider <https://registry.terraform.io/providers/hashicorp/google/latest/docs>

## VSCode extension

Terraform (Anton Kulikov)

## Init, Plan, Apply

```sh
terraform init

terraform plan

terraform apply

# Destroy
terraform destroy
```

## Format code

```sh
terraform fmt
```

Or in the `settings.json` file

```sh
 "[terraform]": {
    "editor.defaultFormatter": "hashicorp.terraform",
    "editor.formatOnSave": true,
    "editor.formatOnSaveMode": "file"
  }
```

## Install GCloud SDK & login

<https://cloud.google.com/sdk/docs/install>

```sh
gcloud init

gcloud auth application-default login
```

## Run Terraform via GCP Shell

```sh
PS1=$

terraform version

mkdir GCS

cd GCS

touch main.tf

terraform init

terraform plan

gcloud auth list

terraform apply
```

## Clean terraform files

```sh
rm -rf terraform/ && rm -rf .terraform/ && rm terraform.tfstate terraform.tfstate.backup && rm -f terraform.lock.hcl .terraform.lock.hcl 2>/dev/null
```

## Generating service account in GCP via Terraform

```sh
./tuto-terraform-gcp/02-GCP/03_service-account

gcloud services enable iam.googleapis.com --project=terraform-gcp-427512

# Enable APIs And Services (in GCP)

terraform init

terraform apply
```
