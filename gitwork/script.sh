#!bin/bash

# Writing a shell script for creating a new feature branch adding a new file commiting it and mergint it back into the main branch

# Variable for file
file="file1.txt"
# Variable for branch
branch="scripttest1"
# Creating a new branch
git branch $branch

# Switching to the new branch
git switch $branch

# Creating anew file in the branch
touch $file

# Addding, commiting and pushing file
git add $file
git commit -m "Adding $file"
git push

# Switching back to main branch
git switch main

# Merging main with new branch
git merge $branch
