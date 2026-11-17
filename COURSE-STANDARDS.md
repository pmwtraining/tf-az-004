# Course Technical Standards

| Component | Standard |
|---|---|
| Terraform CLI | 1.12.2 |
| Terraform constraint | `= 1.12.2` |
| AzureRM provider | 4.74.0 |
| Provider source | `hashicorp/azurerm` |
| Azure region | `norwayeast` |
| Shells | Bash and PowerShell, separately documented |
| Lock files | Generate and commit `.terraform.lock.hcl` |
| Initial state | Local |
| Azure remote state | Created by students in Day 4 |
| HCP Terraform | Dedicated Day 5 labs |

## Provider baseline

```hcl
terraform {
  required_version = "= 1.12.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.74.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  resource_provider_registrations = "none"
}
```

The instructor must verify and freeze the provider release before course publication. Do not place backend configuration in starter labs unless the lab teaches that backend. Do not routinely use `terraform init -upgrade`.

## Release validation
1. Verify Terraform v1.12.2.
2. Run `terraform init`, `terraform validate` and `terraform plan`.
3. Verify the lock file selects AzureRM 4.74.0.
4. Test Bash and PowerShell independently.
5. Verify deployment stays within each student's resource group.
6. Test cleanup and cost controls.
7. Check that no secrets, credentials or state files are committed.
