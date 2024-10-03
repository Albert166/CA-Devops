#!/bin/bash
#Script to add substract divide and multiply two numbers and prints the result.

#Asking for numbers
read -p "Enter first number: " x
read -p "Enter second number: " y

# Doing the calculations and announcing them
let z=x+y
echo "$x + $y = $z"
let q=x-y
echo "$x - $y = $q"
let w=x*y
echo "$x * $y = $w"
let u=x/y
echo "$x / $y = $u"

