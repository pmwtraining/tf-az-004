# Lab 00 -- Student Environment Setup

**Course:** PMWI -- Terraform Associate 004\
**Duration:** 45--60 minutes\
**Difficulty:** Foundation\
**Environment:** Microsoft Azure, Azure Cloud Shell, GitHub

## 1. Lab objectives

By the end of this lab, you will be able to:

1.  Access the PMWI Azure training environment.
2.  Authenticate using your assigned student account and MFA.
3.  Open Azure Cloud Shell.
4.  Verify your Azure subscription and resource group permissions.
5.  Verify Terraform CLI, Azure CLI and Git.
6.  Clone the PMWI Terraform Associate 004 repository.
7.  Initialise and validate a basic Terraform configuration using
    AzureRM.

## 2. Prerequisites

You need your assigned student account, password, any required MFA
setup, and internet access.

### Classroom environment

  ------------------------------------------------------------------------------------
  Setting                             Value
  ----------------------------------- ------------------------------------------------
  Tenant                              `PMW815.onmicrosoft.com` ---
                                      [`<strong>`{=html}OR INSTRUCTOR
                                      PROVIDED`</strong>`{=html}]{style="color:red"}

  Tenant ID                           `88eb28cb-60a8-4d68-9893-04c200e11988` ---
                                      [`<strong>`{=html}OR INSTRUCTOR
                                      PROVIDED`</strong>`{=html}]{style="color:red"}

  Subscription                        `Terrafom` --- [`<strong>`{=html}OR INSTRUCTOR
                                      PROVIDED`</strong>`{=html}]{style="color:red"}

  Subscription ID                     `d7230ba9-236b-4c0e-a48d-d368f142477e` ---
                                      [`<strong>`{=html}OR INSTRUCTOR
                                      PROVIDED`</strong>`{=html}]{style="color:red"}

  Azure region                        `norwayeast` --- [`<strong>`{=html}OR INSTRUCTOR
                                      PROVIDED`</strong>`{=html}]{style="color:red"}
  ------------------------------------------------------------------------------------

**Important:** The instructor may provide different classroom values.
Use the values supplied for your class.

## 3. Sign in to Azure

1.  Open the Azure portal and sign in using your assigned student
    account.
2.  Complete MFA if prompted.
3.  Open Azure Cloud Shell.
4.  Select **Bash** when prompted.

### Bash

``` bash
az login --tenant 88eb28cb-60a8-4d68-9893-04c200e11988
az account set --subscription d7230ba9-236b-4c0e-a48d-d368f142477e
az account show --output table
```

### PowerShell

``` powershell
az login --tenant 88eb28cb-60a8-4d68-9893-04c200e11988
az account set --subscription "d7230ba9-236b-4c0e-a48d-d368f142477e"
az account show --output table
```

**Expected result:** Your student identity, tenant and training
subscription are displayed. Substitute instructor-provided values where
applicable.

## 4. Verify resource group permissions

Each student should have access to their own resource group only.
Replace the example student number with your assigned number.

### Bash

``` bash
az group show --name rg-tf004-student01 --output table
```

Test another student's resource group:

``` bash
az group show --name rg-tf004-student02 --output table
```

### PowerShell

``` powershell
az group show --name rg-tf004-student01 --output table
az group show --name rg-tf004-student02 --output table
```

**Expected result:** Your own resource group is accessible. Access to
another student's resource group is denied with `AuthorizationFailed`.

**Instructor note:** The examples use Student01 and Student02. Students
must replace these names appropriately.

## 5. Verify installed tools

### Bash

``` bash
az version
git --version
terraform version
```

### PowerShell

``` powershell
az version
git --version
terraform version
```

  Tool            Required baseline
  --------------- ---------------------------
  Terraform CLI   `1.12.2`
  Azure CLI       Installed and operational
  Git             Installed and operational

If Terraform is not version `1.12.2`, stop and contact the instructor
before continuing.

## 6. Clone the course repository

Repository: `https://github.com/pmwtraining/tf-az-004`

### Bash

``` bash
mkdir -p ~/pmwi-training
cd ~/pmwi-training
git clone https://github.com/pmwtraining/tf-az-004.git
cd tf-az-004
git remote -v
git branch -a
ls -la
```

### PowerShell

``` powershell
New-Item -ItemType Directory -Force -Path "$HOME\pmwi-training"
Set-Location "$HOME\pmwi-training"
git clone https://github.com/pmwtraining/tf-az-004.git
Set-Location tf-az-004
git remote -v
git branch -a
Get-ChildItem
```

**Expected result:** The repository clones successfully and its remote
points to `pmwtraining/tf-az-004`.

## 7. Create a Terraform provider test

Create a temporary working directory.

### Bash

``` bash
mkdir -p ~/lab00-provider-test
cd ~/lab00-provider-test
cat > main.tf <<'EOF'
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
  subscription_id = "d7230ba9-236b-4c0e-a48d-d368f142477e"
  resource_provider_registrations = "none"
}

data "azurerm_resource_group" "student" {
  name = "rg-tf004-student01"
}
EOF
```

### PowerShell

``` powershell
New-Item -ItemType Directory -Force -Path "$HOME\lab00-provider-test"
Set-Location "$HOME\lab00-provider-test"

@'
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
  subscription_id = "d7230ba9-236b-4c0e-a48d-d368f142477e"
  resource_provider_registrations = "none"
}

data "azurerm_resource_group" "student" {
  name = "rg-tf004-student01"
}
'@ | Set-Content -Path main.tf
```

**Important:** In both examples, replace `rg-tf004-student01` with your
own resource group. If your instructor supplied a different subscription
ID, update that value too.

## 8. Initialise and validate Terraform

Run these commands in Bash or PowerShell:

``` bash
terraform init
terraform fmt
terraform validate
terraform providers
```

**Expected validation result:**

``` text
Success! The configuration is valid.
```

The selected provider should be
`registry.terraform.io/hashicorp/azurerm` at version `4.74.0`.

Inspect the dependency lock file:

### Bash

``` bash
cat .terraform.lock.hcl
```

### PowerShell

``` powershell
Get-Content .terraform.lock.hcl
```

The lock file records the selected provider version and checksums. Do
not routinely use `terraform init -upgrade` during student labs.

## 9. Lab completion checklist

  Task                             Expected result   Complete
  -------------------------------- ----------------- ----------
  Azure sign-in and MFA            Successful        ☐
  Correct subscription selected    Confirmed         ☐
  Own resource group access        Successful        ☐
  Other student's resource group   Access denied     ☐
  Terraform version                `1.12.2`          ☐
  Azure CLI                        Operational       ☐
  Git                              Operational       ☐
  GitHub repository cloned         Successful        ☐
  Terraform initialised            Successful        ☐
  AzureRM provider selected        `4.74.0`          ☐
  Terraform validation             Successful        ☐

## 10. Troubleshooting

  -----------------------------------------------------------------------
  Problem                 Possible cause          Resolution
  ----------------------- ----------------------- -----------------------
  Azure login fails       Incorrect account or    Check assigned account
                          tenant                  and instructor-provided
                                                  tenant ID

  MFA fails               Authenticator setup     Contact the instructor
                          incomplete              

  Wrong subscription      Incorrect subscription  Run `az account set`
                          selected                with the supplied
                                                  subscription ID

  Own RG access denied    Incorrect RG name or    Check student number
                          missing role            and ask instructor to
                                                  verify permissions

  Another student's RG is Permissions broader     Stop and report this to
  accessible              than intended           the instructor

  Terraform version       Incorrect CLI version   Install/use Terraform
  mismatch                                        `1.12.2`

  Provider download fails Network or registry     Check connectivity and
                          connectivity            retry `terraform init`

  Provider authentication Azure CLI session       Run `az login` and
  fails                   expired or wrong        check `az account show`
                          identity                

  Git clone fails         Incorrect URL or        Verify repository URL
                          connectivity            and internet access
  -----------------------------------------------------------------------

## 11. Instructor verification

Before progressing to Lab 01, confirm:

-   Students authenticate to the correct tenant.
-   Each student can access their own resource group.
-   Students cannot access other students' resource groups.
-   Terraform CLI is version `1.12.2`.
-   Azure CLI authentication works.
-   The GitHub repository can be cloned.
-   Terraform initialisation selects AzureRM `4.74.0`.
-   Terraform validation succeeds.
-   No student requires subscription-wide administrative permissions.

**Completion criterion:** Every student passes the checklist.

## Next lab

**Lab 01 -- Terraform Configuration and Providers**

Students will create their first Terraform configuration, examine the
Terraform block, configure the AzureRM provider, and understand the
relationship between Terraform configuration and Azure resources.
