#!/bin/bash

# Creating a script that uses a function to check if directory exists using provided argument of the script.

# Creating variable

PATH=$1

CHECKDIR() {
	if [ -d $PATH ]; then
		echo "Directory $PATH exists"
	else
		echo "ERROR: Directory $PATH doesn't exist"
	fi
	if [ -f $PATH ]; then
		echo "File $PATH exists"
	else
		echo "ERROR: File $PATH doesn't exist"
	fi
}
CHECKDIR
