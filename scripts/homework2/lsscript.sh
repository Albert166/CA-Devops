#!/bin/bash

# Script which mimics ls comand using a for loop.

#Creating Variable log for errors
ERRORLOG=${pwd}error.log
# Asking for file directory path

read -p "Type in directory path: " path

ls -a $path 2>$ERRORLOG
EXITCODE=$?
if [[ $EXITCODE -gt 0 ]] ; then
	echo "Invalid directory check errorlog = $ERRORLOG"
else
	echo "Command succeeded"
fi
