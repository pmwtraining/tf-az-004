#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(pwd)"
COUNT=0

echo "=================================================="
echo " PMWI Terraform 004 - Screenshot Structure Setup"
echo "=================================================="

# Exclude Git and Terraform working directories.
while IFS= read -r -d '' LAB_DIR; do

    NAME="$(basename "$LAB_DIR")"

    # Recognise lab directories, including optional and appendix labs.
    if [[ "$NAME" =~ ^(Lab|lab|Challenge|challenge|Optional|optional|Appendix|appendix) ]] ||
       [[ -d "$LAB_DIR/bash" && -d "$LAB_DIR/powershell" && -d "$LAB_DIR/terraform" ]]; then

        mkdir -p "$LAB_DIR/images"

        if [[ ! -f "$LAB_DIR/SCREENSHOTS.md" ]]; then
            cat > "$LAB_DIR/SCREENSHOTS.md" <<'MARKDOWN'
# Lab Screenshot Checklist

Capture genuine screenshots from the student environment.

| Number | Screenshot filename | Evidence | Complete |
|---|---|---|---|
| 01 | cloud-shell-environment.png | Student environment and working directory | [ ] |
| 02 | terraform-version.png | Terraform 1.12.2 verification | [ ] |
| 03 | configuration-files.png | Relevant configuration files | [ ] |
| 04 | terraform-init.png | Successful initialisation | [ ] |
| 05 | provider-version.png | Correct provider version | [ ] |
| 06 | lock-file.png | Dependency lock file | [ ] |
| 07 | terraform-validate.png | Successful validation | [ ] |
| 08 | terraform-plan.png | Terraform plan | [ ] |
| 09 | execution-result.png | Successful execution, where applicable | [ ] |
| 10 | azure-verification.png | Azure resource verification, where applicable | [ ] |
| 11 | cleanup.png | Successful cleanup, where applicable | [ ] |

## Screenshot requirements

- Use genuine screenshots from the student environment.
- Use Terraform CLI 1.12.2.
- Ensure commands and output are readable.
- Redact passwords, tokens and secrets.
- Include Bash and PowerShell evidence where applicable.
- Embed screenshots in the relevant lab instructions.
- Remove checklist items that are not relevant to the lab.

## Storage

Save screenshots in this directory:

`images/`
MARKDOWN
        fi

        COUNT=$((COUNT + 1))
        echo "[OK] $LAB_DIR"
    fi

done < <(
    find "$REPO_ROOT" \
        -type d \( -name .git -o -name .terraform \) -prune -o \
        -type d -print0
)

echo
echo "=================================================="
echo " Screenshot setup completed."
echo " Lab directories processed: $COUNT"
echo "=================================================="

echo
echo "Review generated directories:"
find "$REPO_ROOT" -type d -name images -not -path '*/.git/*'

echo
echo "Review Git changes:"
git status --short
