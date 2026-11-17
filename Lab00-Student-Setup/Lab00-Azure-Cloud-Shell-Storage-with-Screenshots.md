# Lab 00 – Azure Cloud Shell and Persistent Storage Setup

## Objective

Set up Azure Cloud Shell using a Storage Account and Azure Files share created **inside your assigned PMWI student resource group**.

> **Important:** Create the storage resources first. When configuring Cloud Shell, choose **Select existing storage account**. Do not choose an option that automatically creates a separate Cloud Shell resource group or a new storage account.

## 1. Confirm your student allocation

| Student | Resource group |
|---|---|
| Student 01 | `rg-tf004-student01` |
| Student 02 | `rg-tf004-student02` |
| Student 03 | `rg-tf004-student03` |
| Student 04 | `rg-tf004-student04` |
| Student 05 | `rg-tf004-student05` |
| Student 06 | `rg-tf004-student06` |
| Student 07 | `rg-tf004-student07` |
| Student 08 | `rg-tf004-student08` |
| Student 09 | `rg-tf004-student09` |
| Student 10 | `rg-tf004-student10` |
| Student 11 | `rg-tf004-student11` |
| Student 12 | `rg-tf004-student12` |

Use only your assigned resource group. For example, Student 01 must use `rg-tf004-student01`.

## 2. Create your Storage Account

1. Sign in to the [Azure portal](https://portal.azure.com/).
2. Search for **Storage accounts**, then select **Create**.
3. On the **Basics** tab, enter:

| Setting | Value |
|---|---|
| Subscription | `Terrafom` |
| Resource group | Your assigned student resource group |
| Storage account name | Globally unique lowercase name, e.g. `pmwitf004student01` |
| Region | `Norway East` (`norwayeast`), if available and permitted |
| Performance | `Standard` |
| Redundancy | `Locally-redundant storage (LRS)` |

Storage account names must be 3–24 characters, use lowercase letters and numbers only, and be globally unique. If the example name is unavailable, add digits.

4. Select **Review** or **Review + create**.
5. Resolve validation messages, then select **Create**.
6. Wait for deployment to complete.

**Screenshot 1 – Storage Account creation**

The following is a Microsoft documentation reference image. Your portal layout may differ.

![Create a Storage Account in Azure](https://learn.microsoft.com/en-us/azure/storage/common/media/storage-account-create/create-storage-account-portal.png)

If the image does not display, use Microsoft's [Create a storage account guide](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create).

## 3. Create the Azure Files share

1. Open the Storage Account you just created.
2. Select **Data storage → File shares**.
3. Select **+ File share**.
4. Enter:

| Setting | Value |
|---|---|
| Name | `cloudshell` |
| Access tier | Use the available default/recommended option |

5. Select **Create**.

**Screenshot 2 – Create an Azure file share**

![Azure file shares reference](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share/fileshares-create-portal.png)

If the image does not display, follow [Create an Azure file share](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share).

Your resource structure should resemble:

```text
rg-tf004-student01
└── pmwitf004student01
    └── File shares
        └── cloudshell
```

These are example names; use your own resource group and actual Storage Account name.

## 4. Start Azure Cloud Shell

1. Return to the Azure portal.
2. Select the **Cloud Shell** icon in the top toolbar.

**Screenshot 3 – Open Cloud Shell**

![Cloud Shell button in the Azure portal](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/existing-storage/shell-icon.png)

3. If prompted to choose a shell, select **Bash**.

**Screenshot 4 – Select Bash**

![Azure Cloud Shell shell selection](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/existing-storage/choose-shell.png)

This course uses Bash for command examples unless an exercise says otherwise.

## 5. Mount your existing Storage Account

When the **Getting started** pane appears:

1. Select **Mount storage account**.
2. Select the `Terrafom` subscription.
3. Select **Apply**.

**Screenshot 5 – Getting started and Mount storage account**

![Cloud Shell Getting started storage option](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/existing-storage/getting-started.png)

4. In the **Mount storage account** pane, select **Select existing storage account**.
5. Select **Next**.

**Screenshot 6 – Select existing storage account**

![Choose Select existing storage account](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/existing-storage/use-existing-storage.png)

> **Do not select** “We will create a storage account for you”. Your Storage Account and file share already exist in your assigned student resource group.

6. In **Select storage account**, complete the fields:

| Field | Value |
|---|---|
| Subscription | `Terrafom` |
| Resource group | Your assigned student resource group |
| Storage account name | The Storage Account you created |
| File share | `cloudshell` |

**Screenshot 7 – Select the existing Storage Account and file share**

![Select subscription, resource group, Storage Account and file share](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/media/existing-storage/select-storage.png)

7. Check that the resource group is yours and the file share is `cloudshell`.
8. Select **Select** or **OK**, as shown in your portal, to complete the mount.

The Microsoft screenshot contains generic example values. Do not copy them; select your PMWI student resource group and your own Storage Account.

## 6. Verify persistent storage

In Cloud Shell Bash, run:

```bash
df -h | grep clouddrive
```

Check the mounted directory:

```bash
ls -la ~/clouddrive
```

Create a test file. Replace `01` with your student number:

```bash
echo "PMWI Terraform 004 - Student 01 - $(date)" \\
  > ~/clouddrive/student01-persistence-test.txt
```

Read it:

```bash
cat ~/clouddrive/student01-persistence-test.txt
```

Close the Cloud Shell session, reopen Cloud Shell, and run:

```bash
cat ~/clouddrive/student01-persistence-test.txt
```

The file should still exist and display its original text. If it does not, stop and tell your instructor.

## 7. Confirm the mounted storage location

```bash
mount | grep clouddrive
```

```bash
printf 'Home: %s\\n' "$HOME"
printf 'Cloud drive: %s\\n' "$HOME/clouddrive"
```

## 8. Student completion checklist

| Requirement | Expected result |
|---|---|
| Correct subscription | `Terrafom` |
| Correct student resource group | Your assigned `rg-tf004-studentNN` |
| Storage Account created in that resource group | Yes |
| Storage Account region | `Norway East`, if permitted |
| Performance / redundancy | Standard / LRS |
| Azure Files share | `cloudshell` |
| Existing Storage Account mounted | Yes |
| No unintended Cloud Shell resource group | Confirmed |
| Persistence test file created | Yes |
| Test file survives closing/reopening Cloud Shell | Yes |

## Troubleshooting

- **Your resource group is not listed:** Check the subscription and signed-in student identity. Ask the instructor to check your Contributor assignment.
- **Storage Account creation is denied:** Stop and report the exact error. Do not create resources in another student's resource group.
- **Storage Account name is unavailable:** Choose another globally unique lowercase name.
- **The `cloudshell` share is not listed:** Confirm that you created it in the Storage Account you selected.
- **The mount fails:** Capture the error and contact the instructor. Do not choose automatic creation as a workaround.
- **Norway East is unavailable:** Ask the instructor which approved region to use.

## Instructor validation notes

Before classroom delivery, test with a standard student account that has Contributor on its assigned resource group. Confirm that the student can create a Standard LRS Storage Account in the approved region, create the `cloudshell` file share, mount it in Cloud Shell, and retain files after closing and reopening the session. Confirm that no unintended Cloud Shell resource group is created.

**Screenshot provenance:** These are Microsoft Learn reference screenshots, not screenshots captured from the PMWI tenant. The Storage Account and Azure Files images are documentation references; portal layouts can change. Follow the field values in this lab and the current portal labels.

## Microsoft references

- [Cloud Shell using existing storage](https://learn.microsoft.com/en-us/azure/cloud-shell/get-started/existing-storage)
- [Persist files in Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/persisting-shell-storage)
- [Create a Storage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create)
- [Create an Azure file share](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share)
