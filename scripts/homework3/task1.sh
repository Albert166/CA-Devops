#!/bin/bash

# Setting file variable

file=$1

# Function to to take a filename as an argument and print whether the file is readable, writable or executable.

# Writing a function
RWORX() {	
	if [ -r $file ]; then
	      echo "File is readable"
      else
              echo "Error: File is unreadable"
	fi
        
	if [ -w $file ]; then
              echo "File is writable"
      else
              echo "Error: File is unwritable"
	fi
	if [ -x $file ]; then
	      echo "File is executable"
      else
	      echo "Error: File is non-executable"
	fi
}
RWORX
