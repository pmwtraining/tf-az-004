# Lab 00 – Student Environment Setup

## Objectives
Access the PMWI Azure classroom, choose Bash or PowerShell, verify Terraform and Azure CLI, clone the course repository, and confirm access to your own resource group.

Your instructor must provide your student account, tenant ID, subscription context and assigned resource-group name.

## 1. Verify tools

### Bash
```bash
az version
terraform version
git --version
```

### PowerShell
```powershell
az version
terraform version
git --version
```

Terraform must report `Terraform v1.12.2`. Stop and contact the instructor if it does not.

## 2. Sign in to Azure

Use the tenant ID supplied by the instructor.

### Bash
```bash
az login --tenant <TENANT_ID>
az account show
```

### PowerShell
```powershell
az login --tenant <TENANT_ID>
az account show
```

Confirm your identity, tenant and subscription with the instructor.

## 3. Clone the repository

### Bash
```bash
git clone https://github.com/pmwtraining/tf-az-004.git
cd tf-az-004
find . -maxdepth 2 -type d
```

### PowerShell
```powershell
git clone https://github.com/pmwtraining/tf-az-004.git
Set-Location tf-az-004
Get-ChildItem -Force
```

## 4. Verify your resource-group access

Replace the placeholder with the exact resource-group name allocated to you.

### Bash
```bash
az group show --name <YOUR_RESOURCE_GROUP>
```

### PowerShell
```powershell
az group show --name <YOUR_RESOURCE_GROUP>
```

You should be able to read your own resource group. Do not attempt to access another student's resource group.

## 5. Initial Terraform checks

Run these commands in a lab's `terraform/` directory when supplied with a configuration.

### Bash
```bash
terraform init
terraform validate
terraform providers
```

### PowerShell
```powershell
terraform init
terraform validate
terraform providers
```

## Completion checklist
- [ ] Azure sign-in successful.
- [ ] Correct student identity, tenant and subscription confirmed.
- [ ] Bash or PowerShell selected.
- [ ] Terraform 1.12.2 verified.
- [ ] Git verified.
- [ ] Repository cloned.
- [ ] Own resource group accessible.
- [ ] No access to another student's resource group required.

Stop and contact the instructor if identity, version or permission checks differ from the course instructions.
