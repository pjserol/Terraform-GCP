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

## Compute images list

```sh
gcloud compute images list
```

## SSH VM Instance via gcloud

```sh
gcloud compute ssh vm-instance
```

## SSH VM Instance via ssh client

```sh
gcloud compute instances list --filter="name=('vm-instance')"
# External IP: 34.67.63.127

ssh-keygen -t rsa -b 4096 -C  "pj.serol.au@gmail.com" -f ./my-ssh-key
# After generating the key, add username (username:ssh-rsa-etc)

chmod 600 ./my-ssh-key

gcloud compute project-info add-metadata --metadata-from-file=ssh-keys=./my-ssh-key.pub

# Is it optional?
gcloud compute instances add-metadata vm-instance --metadata-from-file ssh-keys=./my-ssh-key.pub

# If getting message Host key has changed, run:
ssh-keygen -R 34.67.63.127

ssh -i ./my-ssh-key pjserol@34.67.63.127

# Then you can run
uptime # system uptime and load
df -h # check disk usage
free -m # memory usage
ip a # view ip address
gcloud auth list # check service account

# With icmp protocol enable for ip address of the machine
# https://whatismyipaddress.com/
ping 34.70.81.172

# Helper Command
gcloud compute os-login ssh-keys list

gcloud compute project-info describe --format="value(commonInstanceMetadata[items][ssh-keys])"
```

## Connection to Cloud SQL via MySQL or gcloud

```sh
# Install mysql client
brew install mysql-client
```

```sh
# Via MySQL with public IP Address
mysql -u user-mysql -ppwd123 -h 146.148.51.111
```

```sh
# Via gcloud
gcloud sql connect instance-mysql --user=user-mysql --quiet
# enter password pwd123
```

```sh
# MySQL Commands
mysql > show databases;

# Optional if done with terraform
# CREATE DATABASE example_db;

USE database-mysql;

SHOW TABLES;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO employees (name) VALUES ('John Doe');

SELECT * FROM employees;
```
