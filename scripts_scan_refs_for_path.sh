#!/usr/bin/env bash
set -euo pipefail

TARGET_PATH="${1:-PPT/AICTE_IBM_BOB_Project_Submission_Template_for_EduentFoundation_ (1) (1).pptx}"
REPO_ROOT="$(git rev-parse --show-toplevel)"

cd "$REPO_ROOT"

echo "Repository: $REPO_ROOT"
echo "Target path: $TARGET_PATH"

echo "Fetching all remotes and tags..."
git fetch --all --tags --prune

if git rev-parse --is-shallow-repository >/dev/null 2>&1 && [ "$(git rev-parse --is-shallow-repository)" = "true" ]; then
  echo "Repository is shallow; unshallowing..."
  git fetch --unshallow --tags --prune
fi

echo
printf "%-60s | %s\n" "REF" "STATUS"
printf '%.0s-' {1..80}
echo

found_any=0
while IFS= read -r ref; do
  if git ls-tree -r --name-only "$ref" -- "$TARGET_PATH" | grep -Fxq "$TARGET_PATH"; then
    status="FOUND"
    found_any=1
  else
    status="NOT FOUND"
  fi
  printf "%-60s | %s\n" "$ref" "$status"
done < <(git for-each-ref --format='%(refname)' refs/heads refs/remotes refs/tags)

echo
if [ "$found_any" -eq 1 ]; then
  echo "At least one ref contains the target path at its tip."
else
  echo "No scanned refs contain the target path at their tip."
fi
