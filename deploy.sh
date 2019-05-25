#!/bin/bash

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# 1. main repository
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master


# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`


# 2. organisation repository
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Go To Docs folder
cd docs

# Add changes to git.
git init
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Add repository
git remote add origin https://github.com/everyone-can-code/fp.git

# Push source and build repos.
git push origin master --force

# Come Back up to the Project Root
cd ..

# 2. organisation repository
