#!bin/bash

#Write a function to create a directory and a file inside it. Directory and filename should be passed as an argument to the script.

# Setting Variables
DIRECTORY=$1
FILENAME=$2

#Making the function

CREATEDIR() {
	mkdir -p $DIRECTORY
	touch $DIRECTORY/$FILENAME
}

#Running the function

CREATEDIR
