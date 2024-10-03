#!/bin/bash

# Script to generate a random 10 character string until it generates astring with user inputed 3-char long value.

#Function for random string



# Checking if input is correct

if [[ -z "$1" ]]; then
	echo "Error: Please provide a 3 lowercase letters long string as an argument."
	exit 
fi

if [[ ${#1} -ne 3 ]]; then
	echo "Error: Please provide a 3 lowercase letters long string as an argument."
        exit 
fi

input=$1

# Random string script with grep function to look for input which user inputted

RNDSTRING() {
        cat /dev/urandom | tr -dc 'a-z' | head -c 10 | grep $input

}

# Doing the function for making random character strings until it generates a string which matches the input variable.
count=0
found="false"
while [[ $found == "false" ]]; do
	((count++))
	RNDSTRING
	if [[ $? -eq 0 ]]; then
	       found=true
       echo "How many tries it took = $count "       

	fi
done

