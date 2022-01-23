# Terraform Deployment
This terraform chart highlights the structure I like to use for my deployments.

You can read more about it in my blog post [here](https://www.itinsights.org/terraform-deployments/).

# Contact
If you have any suggestions or question, just create an issue or reach out on Twitter [@chrburmeister](https://twitter.com/chrburmeister).

# Use the Deployment (locally)

1. clone the repo
2. fill out empty variables in the **env_dev.tfvars** file
3. create two files: 

## env_dev_backend.sec.tfvars
```powershell
storage_account_name = ""
resource_group_name  = ""
container_name       = "terraform"
key                  = ""
access_key           = ""
```
**key** is the name of the state-file within the backend - for instance: **env_dev.tfstate**

## env_dev.sec.tfvars
```powershell
client_id     = ""
client_secret = ""
```

```Powershell
# deploy
terraform init -reconfigure -input=false -upgrade -backend-config .\env_dev_backend.sec.tfvars

terraform plan -var-file=".\env_dev.tfvars" -var-file=".\env_dev.sec.tfvars" -input=false -out="tfplan"

terraform apply "tfplan"

# destroy
terraform init -reconfigure -input=false -upgrade -backend-config .\env_dev_backend.sec.tfvars

terraform plan -destroy -var-file=".\env_dev.tfvars" -var-file=".\env_dev.sec.tfvars" -input=false -out="tfplan"

terraform apply "tfplan"
```