#!/bin/bash

# Bash script to write a CSV report showg the number of files and the total size in bytes of each subdirectory in the given directory

# Setting variables

DIRECTORY=$1
REPORT=${pwd}report.csv

# Checking if argument is a folder
if [ ! -d "$DIR" ]; then
	echo "It's not a directory"
	exit 1
fi

# Looking and going though all subdirectories in the directory

for dir in "$DIRECTORY"/*/; do
	if [ -d "$dir" ];then
		# Count the number of files
		FILES=$(find "$dir" -type f | wc -l)
		SIZE=$(du -sb "$dir" | awk '{print $1}')
		dir_name=$(basename "$dir")
		# Writing results to the csv report
		echo "Name:$dir_name ,Files number:$FILES ,Total Size:$SIZE" >> "$REPORT"
	fi
done
