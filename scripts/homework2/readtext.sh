#!/bin/bash

#Script to select a file and keyword to print the specific lines.

# Asking for file name and keyword

read -p "Type the file name and direction if needed for the file: " file
read -p "Type the keyword which you want to search in the file: " keyword

# Searching the keyword in specific file and displaying it
cat $file | grep $keyword
