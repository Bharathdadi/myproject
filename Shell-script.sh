#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="issues"

    # Fetch the list of issues on the repository
    issues="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of issues of the repo
    if [[ -z "$issues" ]]; then
        echo "No list of issues with in the repo for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "there are list of issues in the repo ${REPO_OWNER}/${REPO_NAME}:"
        echo "$issues"
    fi
}

# Main script

echo "List of issues in the repo to ${REPO_OWNER}/${REPO_NAME}..."
list issues with in the repo
