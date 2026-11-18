# Lab 00 – Screenshot Capture Guide

## Included PMWI classroom screenshots
1. `images/01-storage-account-basics.png` – Storage Account Basics.
2. `images/02-storage-account-created.png` – Storage account deployment succeeded.
3. `images/03-cloudshell-file-share.png` – `cloudshell` file share in Storage browser.
4. `images/04-cloud-shell-welcome.png` – Welcome to Azure Cloud Shell.
5. `images/05-cloud-shell-storage-configuration.png` – Mount storage account selected.
6. `images/06-select-existing-storage.png` – Existing subscription, student RG, storage account and share selected.
7. `images/07-cloud-shell-bash-ready.png` – Bash terminal connected.
8. `images/08-cloudshell-mount-verification.png` – `df -h` and `ls -la ~/clouddrive` output.
9. `images/09-persistence-test-created.png` – Persistence file created and read.
10. `images/10-persistence-after-reopen.png` – Same file read after reopening Cloud Shell.
11. `images/11-terraform-version-mismatch.png` – Initial Cloud Shell Terraform 1.17.0 mismatch.
12. `images/12-terraform-1.12.2-verified.png` – Terraform 1.12.2 installed, activated and verified.
13. `images/13-azure-cli-authentication-verified.png` – `Terrafom` subscription selected and Azure access token obtained; subscription GUID obscured.

## Completion status
The live Student 01 walkthrough verified the storage account, `cloudshell` share, Bash session, persistent mount, persistence across sessions, Terraform 1.12.2 and Azure CLI authentication. The student resource-group query also returned `rg-tf004-student01` in `norwayeast`.

The initial Terraform 1.17.0 capture is retained as a diagnostic teaching image. It is not the accepted final version. The accepted version is shown in screenshot 12.

## Screenshot quality and privacy
- Use genuine PMWI Azure portal/Cloud Shell captures, not mock-ups.
- Keep relevant commands and output visible.
- Obscure email addresses, tenant IDs, subscription IDs, access tokens and unrelated notifications.
- Preserve values needed to teach the workflow: resource group, storage account, region, file-share name and success status.
- Keep filenames and numbering consistent with the workbook.

## Handoff
Repository cloning, Terraform configuration, AzureRM provider initialisation, lock-file generation, validation and read-only planning are covered by Lab01.
