#!/bin/bash
# 1. create 5 files with the names: - 1-file.out - 2-file.out - 3-file.out - 4-file.out - 5-file.out 2. list the contents of all files up to 9-file.out 3. Output errors to a file error.log if there are any errors. 4. Write a message 'No errors encountered' if there were no errors, and 'Errors found. Manual check needed' if there were erros to a file output.log.
# Function to create 5 files
#Define Log Files
OUTPUT_LOG="output.log"
ERROR_LOG="error.log"
#Create files
touch 1-file.out 2-file.out 3-file.out 4-file.out 5-file.out

#Step 2 list all contesnts of ll files up to 9-file.out
{
	ls 1-file.out 2-file.out 3-file.out 4-file.out 5-file.out 6-file.out 7-file.out 8-file.out 9-file.out
} > "$OUTPUT_LOG" 2> "$ERROR_LOG"
if [ -s "$ERROR_LOG" ]; then
	echo "Errors found. Manual check is needed"
else
	echo "No errors encountered"
fi
