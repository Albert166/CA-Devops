#!/bin/bash

# Script to simulate ls command. Which takes directory as an input and displays the names and files of directories in itit should also support the -l option which display additional information about each file or directory.

# Main script variables
TARGET_DIR=$1
LMODE=$2

# Writing the functions for ls and ls -l

LSSCRIPT() {
	find $TARGET_DIR -maxdepth 1 | awk -F/ '{print $2}'
	
}

LSLSCRIPT() {
	for item in "$TARGET_DIR"/*; do
		if [ -e "$item" ]; then
			# Getting file info
			permissions=$(stat -c "%A" "$item")
			owner=$(stat -c "%U" "$item")
			group=$(stat -c "%G" "$item")

			# Printing output
			printf "%s %s %s %s\n" "$permissions" "$owner" "$group" "$(basename "$item")"
		fi
	done
	
}

        if [[ $LMODE == "-l" ]]; then
	     LSLSCRIPT $1
        else
	     LSSCRIPT $1
	fi


