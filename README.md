# PMWI Terraform Associate 004 – Azure Student Repository

Starting-point repository for the five-day PMWI Terraform Associate 004 course.

## Course standards
- Terraform CLI: 1.12.2 (`required_version = "= 1.12.2"`)
- AzureRM provider: 4.74.0 (`version = "= 4.74.0"`)
- Azure region: `norwayeast`
- Students work only in their allocated resource group.
- Every lab has separate Bash and PowerShell instructions.
- Commit `.terraform.lock.hcl` for every tested Terraform configuration.
- State starts locally. Students create Azure Storage remote state during Day 4.
- HCP Terraform is covered in dedicated Day 5 labs.

## GitHub repository

Canonical course repository: https://github.com/pmwtraining/tf-az-004

Students can clone it with:

```bash
git clone https://github.com/pmwtraining/tf-az-004.git
```

## Start here
1. Complete `Lab00-Student-Setup`.
2. Verify your identity, tenant, subscription and assigned resource group with the instructor.
3. Choose Bash or PowerShell and follow only that shell's instructions.
4. Never share credentials or state files.
5. Complete cleanup steps after each lab.

## Structure
- `Lab00-Student-Setup/`
- `Day01-Fundamentals/` through `Day05-Advanced-HCP/`
- `Appendix-Optional-Labs/`
- `Appendix-Challenges/`
- `Shared/`
- `Instructor/` (instructor-only material; keep out of the student repository)

This is a starter scaffold. All labs require authoring, testing and instructor approval before release.
