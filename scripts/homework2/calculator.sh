#!/bin/bash
# Script for making simple calculator

# Asking to input which operation user wants to perform

read -p "Enter your desired operation add, substract, multiply or divide: " operation
read -p "Input first number: " firstnumber
read -p "Input second number: " secondnumber

#Defining x and y
x="$firstnumber"
y="$secondnumber"

#Calculating results

if [[ $operation == "add" ]]; then
let z=x+y
echo "Add result=$z"
elif [[ $operation == "substract" ]]; then
let	z=x-y
echo "Divide Result=$z"
elif [[ $operation == "multiply" ]]; then
let	z=x*y
echo "Multiplication result=$z"
elif [[ $operation == "divide" ]]; then
let	z=x/y
echo "Divide result=$z"
else
	echo "Please select operation from add, substract, multiply, divide"
fi
