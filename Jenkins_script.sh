#!/bin/bash

# Define SSH connection details
remote_username="ubuntu"
remote_hostname="13.126.78.84"
remote_git_repo_url="git@github.com:PremkumarDivakaran/webdriver-tests.git"

# SSH into the remote machine
ssh -o StrictHostKeyChecking=no "$remote_username@$remote_hostname" << EOF

# Perform the git clone operation
git clone "$remote_git_repo_url"

# Navigate to Project Folder
cd webdriver-tests

# Run shell scripts
chmod +x health-check.sh
./health-check.sh

# Exit the SSH session
exit

EOF
