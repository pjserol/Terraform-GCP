# Terraform & GCP

## Install Terraform

`https://developer.hashicorp.com/terraform/install?product_intent=terraform`

```sh
terraform version
```

## Terraform Documentation

Main documentation <https://registry.terraform.io/>

Local file <https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file>

## VSCode extension

Terraform (Anton Kulikov)

## Init, Plan, Apply

```sh
terraform init

terraform plan

terraform apply
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
