#!/bin/bash
# Ask for a number

read -p "Please input your number you want to be multiplied: " number

#Doing the multiplying using loop

for i in {1..10}; do
	let z=$number*$i
	echo "$number * $i = $z"
done
