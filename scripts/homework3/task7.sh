#!/bin/bash

# Script that uses functions to create a backup of a given directory. It should first check whether sufficient disk space is available for the backup. It should then create the backup and report any errors that occur during this process.

# Variables for freespace and foldersize

FREESPACE=$(df -Pk . | sed 1d | grep -v used | awk '{ print $4 "\t" }')
FOLDERSIZE=$(du $1 | awk '{ print $1}')

#Script for backup

BACKUP() {
	if [ $FREESPACE -gt $FOLDERSIZE ]; then
	        mkdir $1.backup 2> backuperror.txt
	       	cp -r $1 $1.backup 2> backuperror.txt
		cat backuperror.txt
	else 
		echo "Error not enough space"
	fi
}
BACKUP "$1"

