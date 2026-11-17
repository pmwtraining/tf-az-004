# Lab 00 -- Student Environment Setup

**Course:** PMWI -- Terraform Associate 004\
**Duration:** 45--60 minutes\
**Difficulty:** Foundation\
**Environment:** Microsoft Azure, Azure Cloud Shell, GitHub

## 1. Lab objectives

By the end of this lab, you will be able to:

1.  Access the PMWI Azure training environment.
2.  Sign in to the PMWI classroom using the username and password
    supplied by your instructor, then complete any required MFA.
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

  ------------------------------------------------------------------------------
  Setting                       Value
  ----------------------------- ------------------------------------------------
  Tenant                        `PMW815.onmicrosoft.com` ---
                                [`<strong>`{=html}OR INSTRUCTOR
                                PROVIDED`</strong>`{=html}]{style="color:red"}

  Tenant ID                     `88eb28cb-60a8-4d68-9893-04c200e11988` ---
                                [`<strong>`{=html}OR INSTRUCTOR
                                PROVIDED`</strong>`{=html}]{style="color:red"}

  Subscription                  `Terrafom` --- [`<strong>`{=html}OR INSTRUCTOR
                                PROVIDED`</strong>`{=html}]{style="color:red"}

  Subscription ID               `d7230ba9-236b-4c0e-a48d-d368f142477e` ---
                                [`<strong>`{=html}OR INSTRUCTOR
                                PROVIDED`</strong>`{=html}]{style="color:red"}

  Azure region                  `norwayeast` --- [`<strong>`{=html}OR INSTRUCTOR
                                PROVIDED`</strong>`{=html}]{style="color:red"}
  ------------------------------------------------------------------------------

**Important:** The instructor may provide different classroom values.
Use the values supplied for your class.

## 3. Sign in to the PMWI classroom

**All students start at the Azure portal and complete the lab in Azure Cloud Shell.** You do not need to install Azure CLI, Terraform or Git on your own computer for the Cloud Shell activities in this lab.

Your instructor will provide an individual classroom username and password. Use only the account assigned to you. Do not use a personal Microsoft account or another student's credentials.

### 3.1 Open the Azure portal

1. Open Microsoft Edge or Google Chrome.
2. Select the address bar and enter **https://portal.azure.com**.
3. Press **Enter**. Check that the address is `https://portal.azure.com` before entering credentials.

### 3.2 Sign in with the username and password supplied by your instructor

1. On the Microsoft sign-in page, enter the **username provided by your instructor**. It will normally look similar to `student01@PMW815.onmicrosoft.com`. Your actual student number and sign-in name may differ.
2. Select **Next**.
3. Enter the **password provided by your instructor**.
4. Select **Sign in**.
5. If Microsoft asks whether this is a personal or work/school account, choose **Work or school account**.
6. If prompted to change a temporary password:
   - Enter the temporary password supplied by your instructor.
   - Enter and confirm a new password that meets Microsoft's displayed requirements.
   - Keep the new password private. Do not share it with the instructor or other students.
7. If prompted to register security information or MFA, follow the on-screen instructions and the instructor's classroom guidance. If Microsoft Authenticator is required, complete the displayed registration process. Never approve an MFA request you did not initiate.
8. If a **Stay signed in?** prompt appears, follow the instructor's guidance. On a shared or public computer, select **No**.
9. Wait for the Azure portal home page to load.
10. Select your account/profile icon in the top-right corner. Confirm that the signed-in account is your assigned `@PMW815.onmicrosoft.com` classroom account, not a personal account.

**Checkpoint:** Do not continue if the wrong account is displayed. Sign out and repeat the process using the correct classroom username, or ask your instructor for help.

### 3.3 Check the classroom directory and subscription

1. In the portal, select the account/profile icon in the top-right corner.
2. Open **Switch directory** (the wording or menu location can vary).
3. Check that the PMWI classroom directory is selected. The expected tenant is `PMW815.onmicrosoft.com`, unless your instructor supplied a different tenant.
4. Close the directory panel and return to the portal home page.
5. Use the portal search bar to search for **Subscriptions** and open the Subscriptions service.
6. Confirm that the training subscription supplied by your instructor is listed. The example subscription name for this classroom is `Terrafom`.
7. If the directory or subscription is missing, stop and contact your instructor. Do not create resources in another subscription.

### 3.4 Open Azure Cloud Shell from the portal

1. Stay signed in to `https://portal.azure.com`.
2. Look at the toolbar across the top of the Azure portal.
3. Select the **Cloud Shell** button. It is the terminal-shaped `>_` icon.

**Screenshot 1 – Cloud Shell button in the Azure portal toolbar**

![Cloud Shell button in the Azure portal toolbar](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/shell-icon.png)

4. The Cloud Shell pane opens at the bottom of the portal. The first time you open it, Microsoft may ask you to choose an environment.
5. Select **Bash** for this course unless your instructor specifically directs you to use PowerShell. Most lab command examples use Bash; PowerShell alternatives are provided where needed.

**Screenshot 2 – Select Bash or PowerShell**

![Azure Cloud Shell shell selection](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/choose-shell.png)

6. Wait while Cloud Shell initialises. Do not enter commands until the terminal prompt appears.

### 3.5 Create persistent Cloud Shell storage in your assigned resource group

**For this course, use persistent Cloud Shell storage.** The storage account and Azure Files share must be created in your own assigned student resource group, under the PMWI **Terraform training subscription**. Do not use another student's resource group and do not allow the wizard to create a separate resource group.

> **Important terminology:** This is Azure-hosted persistent storage mounted into Cloud Shell. It is not storage on your personal Windows computer. Files saved in `~/clouddrive` remain available when you close and reopen Cloud Shell, provided the storage account and file share are retained.

Before starting, make sure you know:
- Your assigned resource group, for example `rg-tf004-student01`.
- The Terraform training subscription. In the current classroom configuration its display name may appear as `Terrafom`; select the subscription matching the ID supplied by your instructor.
- The approved Cloud Shell storage region. Use `norwayeast` if it is permitted for the subscription and offered by the wizard. If Azure rejects that region, stop and ask the instructor which permitted region to use.

#### Step-by-step storage setup

1. In the Azure portal, open Cloud Shell using the `>_` toolbar button.
2. Select **Bash** when the welcome prompt appears. Bash is the standard shell for this course.
3. In the **Getting started** pane, select **Mount storage account**.
4. In **Storage account subscription**, select the PMWI Terraform training subscription. Check that it is the subscription ID provided by your instructor.
5. Select **Apply**.
6. In the **Mount storage account** pane, select **I want to create a storage account**. Do not select the automatic option **We will create a storage account for you**, because that option may create storage in a separate Cloud Shell resource group rather than your assigned student resource group.
7. Select **Next**.
8. In the storage configuration form, enter/select the following:
   - **Resource group:** select **Use existing** (or the equivalent existing-resource-group choice), then select your assigned resource group, such as `rg-tf004-student01`.
   - **Region:** select `norwayeast` if available and permitted. Otherwise use only a region approved by your instructor.
   - **Storage account:** enter a globally unique name using lowercase letters and numbers only. For example, `pmwitf004s01abc`. Replace the example with a unique value; Azure storage account names must be globally unique, 3–24 characters, and contain only lowercase letters and numbers.
   - **File share:** enter a name such as `cloudshell`. Use lowercase letters, numbers and hyphens; begin and end with a letter or number.
9. Review the subscription and resource group carefully. They must be the Terraform training subscription and your own student resource group.
10. Select **Create** (or **Review + create**, then **Create**, if the wizard presents a review page).
11. Wait for Azure to create the storage account and file share and mount the share into Cloud Shell. This can take a few minutes.
12. When the Bash prompt appears, continue to the verification commands in section 3.6.

**Screenshot 3 – Choose persistent storage and select the subscription**

![Azure Cloud Shell Getting started: select Mount storage account and the subscription](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/getting-started.png)

**Screenshot 4 – Choose the custom storage-account creation option**

![Azure Cloud Shell Mount storage account options](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/create-storage.png)

**Screenshot 5 – Cloud Shell toolbar button**

![Cloud Shell button in the Azure portal toolbar](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/shell-icon.png)

**Screenshot 6 – Select Bash**

![Azure Cloud Shell shell selection](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/new-storage/choose-shell.png)

The next configuration form is displayed after selecting **I want to create a storage account** and **Next**. Its fields can vary slightly as Microsoft updates the portal. Follow the field names in step 8 and check the resource group and subscription before creating anything.

#### Verify that persistent storage is mounted

Run these commands in Bash:

```bash
pwd
ls -la
ls -la ~/clouddrive
```

The current directory may initially be your home directory. The `~/clouddrive` directory should exist when the Azure file share is mounted.

Create a small test file in the persistent drive:

```bash
cd ~/clouddrive
echo "PMWI Terraform 004 Cloud Shell storage test" > lab00-storage-test.txt
cat lab00-storage-test.txt
```

Close Cloud Shell using its toolbar close button, reopen it from the Azure portal, and run:

```bash
cat ~/clouddrive/lab00-storage-test.txt
```

**Expected result:** The test text is displayed after reopening Cloud Shell. This confirms that the file is stored on the mounted persistent Azure Files share.

#### Important storage and cost guidance

- Cloud Shell persistent storage uses an Azure Storage account and Azure Files share. Storage charges may apply to the student's training subscription.
- Keep the storage account and file share for the duration of the course. Do not delete them when closing Cloud Shell.
- Do not store passwords, access keys, personal information or other secrets in the test file or course repository.
- Each student must create and use their own storage account in their own resource group. Do not share a Cloud Shell storage account or file share between students.
- The storage account's region may be subject to subscription policy. If `norwayeast` is not permitted, do not repeatedly try random regions; ask the instructor for an approved region.
- If the wizard does not offer an existing resource group, or your own resource group is missing from the list, stop and contact the instructor. Do not accept an automatically created resource group.

### 3.6 Confirm your Azure CLI sign-in and select the training subscription

Cloud Shell normally authenticates automatically using the account with which you opened the Azure portal. **Do not start with `az login` unless the commands below show that you are not signed in.**

Run these commands in the Bash terminal:

```bash
az account show --output table
az account list --output table
```

Check the output for your classroom username, tenant and training subscription. Then set the correct subscription explicitly:

```bash
az account set --subscription "d7230ba9-236b-4c0e-a48d-d368f142477e"
az account show --output table
```

If your instructor supplied a different subscription ID, use that value instead.

**If Azure CLI reports that you are not logged in:** run the following command in Cloud Shell and complete the sign-in process it presents:

```bash
az login --tenant 88eb28cb-60a8-4d68-9893-04c200e11988
```

Then set the subscription and verify again:

```bash
az account set --subscription "d7230ba9-236b-4c0e-a48d-d368f142477e"
az account show --output table
```

**Expected result:** The output identifies your assigned student account, the PMWI tenant and the training subscription. If the tenant or subscription is incorrect or missing, stop and contact the instructor.

### 3.7 Cloud Shell controls and switching shells

- Cloud Shell opens as a panel at the bottom of the Azure portal. Use the maximise control if you need more terminal space.
- Use the shell selector in the Cloud Shell toolbar to switch between **Bash** and **PowerShell**.
- Files saved in `~/clouddrive` are held in the mounted Azure Files share and persist between sessions. Files saved elsewhere in the temporary Cloud Shell container may not persist.
- You can reopen Cloud Shell using the `>_` toolbar button.

See Microsoft's illustrated guide: [Get started with Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/new-storage) and [How to use the Cloud Shell window](https://learn.microsoft.com/en-gb/azure/cloud-shell/use-the-shell-window-new).

### Sign-in and Cloud Shell troubleshooting

- **Username or password rejected:** Check the exact username with your instructor. Passwords are case-sensitive; check Caps Lock and keyboard layout. Ask the instructor to verify or reset the account rather than repeatedly guessing.
- **MFA prompt cannot be completed:** Do not bypass MFA or use another student's account. Ask the instructor for help.
- **Wrong directory or no subscription shown:** Check the profile/directory selector and ask the instructor to confirm tenant and subscription access.
- **Cloud Shell button is missing or fails to open:** Refresh the portal once. If it still fails, report the time and exact error to the instructor; the Cloud Shell service or `Microsoft.CloudShell` provider may need instructor-side attention.
- **Your assigned resource group is not available in the storage wizard:** Stop and ask the instructor to verify your Contributor access on that resource group. Do not allow Cloud Shell to create a separate resource group.
- **`az account show` reports no logged-in account:** Use the conditional `az login` command above.
- **Access denied:** Record the full error and give it to the instructor. Do not request subscription-wide administrator permissions.


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
