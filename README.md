# Manage adfinis-sygroup repos with Terraform

# THIS IS UNTESTED! DO NOT USE!

## Instructions

```
git clone git@github.com:MrStrix/github-tf
cd github-tf
terraform init
export TF_VAR_github_token="YOURACCESSTOKEN"
terraform plan -var-file=adfinis-sygroup.tfvars
```


