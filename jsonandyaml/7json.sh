#!/bin/bash

# Script to manipulate json files Creating new entry in students.

# Creating Variable for filename
FILE=task7.json

# Deleting last line
sed -in '$d' $FILE 

# Adding new values based on user inputs.
read -p "Enter student name: " name
read -p "Enter student age: " age
read -p "Enter student grade: " grade
read -p "Enter 1st subject: " subject1
read -p "Enter 2nd subject: " subject2
read -p "Enter 3rd subject: " subject3

# Adding those values to the file
echo "," >> $FILE
echo "  {" >> $FILE
echo '    "'name'": "'$name'",' >> $FILE
echo '    "'age'": "'$age'",' >> $FILE
echo '    "grade": "'$grade'", ' >>$FILE
echo '    "subjects":[' >> $FILE
echo '      "'$subject1'", ' >> $FILE
echo '      "'$subject2'", ' >> $FILE
echo '      "'$subject3'" ' >> $FILE
echo "     ]" >> $FILE
echo "  }" >> $FILE
echo "}" >> $FILE
