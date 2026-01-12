#!/usr/bin/sh

set -e

# GitHub repositories Git mirroring.
# Pretty straightforward: retrieve repositories' list, then clone and fetch updates.
# It is advised to run this script through a crontab.

# Custom config starts here
# STORAGE_PATH: where repositories should be stored on your system
# USERNAME: your GitHub username
# TOKEN: Personal Access Token (PAT) created from your GitHub settings.
#        Permission: READ-ONLY access to Repository > Contents.

readonly STORAGE_PATH="."
readonly USERNAME=""
readonly TOKEN=""
# Custom config stops here

readonly REPOSITORIES_BASE_URL="https://${TOKEN}@github.com/${USERNAME}"

[ -d "$STORAGE_PATH" ] || mkdir -v "$STORAGE_PATH"

echo "Getting ${USERNAME}'s repositories list..."
REPOS="$(curl -s -H "Authorization: Bearer $TOKEN" https://api.github.com/search/repositories?q=user:$USERNAME | jq '.items[].name' | tr -d '"' | sort -f)"

for repo in $REPOS; do
        REPO_PATH="${STORAGE_PATH}/${repo}"

        if [ -d "$REPO_PATH" ]; then
                echo "Fetching $repo..."
                git --git-dir="$REPO_PATH" fetch
        else
                mkdir "$REPO_PATH"
                echo "New repo found. Cloning $repo..."
                git clone --mirror "${REPOSITORIES_BASE_URL}/${repo}.git" "$REPO_PATH"
        fi
done