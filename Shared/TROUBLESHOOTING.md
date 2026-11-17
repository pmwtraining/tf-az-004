# Shared Troubleshooting

- **Terraform version mismatch:** Check `terraform version`. The baseline is 1.12.2. Stop if a different version is active.
- **Provider mismatch:** Inspect `.terraform.lock.hcl` and run `terraform providers`. Do not use `terraform init -upgrade` as a workaround.
- **Azure authentication:** Check `az account show` and confirm the signed-in student, tenant and subscription.
- **Authorization failure:** Confirm the action is within your assigned resource group. Normal labs must not require subscription-wide Owner or Contributor.
- **Provider registration:** Subscription-level provider registration is managed by the instructor.
- **State safety:** Never delete or manually edit state as a troubleshooting shortcut. Follow the lab recovery instructions.
