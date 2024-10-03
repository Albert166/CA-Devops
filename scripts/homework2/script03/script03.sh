#!/bin/bash

#A script to run the 2nd script depending on the user input

# Script location and name

SCRIPT=/home/albert/scripts/homework2/script02/script.sh

read -p "Please input 3 lowercase letters for the script to run or input exit to exit: " input
if [[ "$input" == "exit" ]]; then
	exit
else
	. $SCRIPT $input
fi

