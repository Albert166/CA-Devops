#!/bin/bash

# Script that uses functions to copy all files from one directory to another

# Setting variables for original directory and destination directory
set -u

ORGDIR=$1
DESTDIR=$2

# Function to copy all listed files
COPY() {	
	cp $ORGDIR/*.txt $DESTDIR/
}
COPY
