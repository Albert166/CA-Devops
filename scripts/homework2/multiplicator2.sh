#!/bin/bash
# Ask for a number

read -p "Please input your number you want to be multiplied: " number
read -p "Please input to which number you want to be multiplied, maximum allowed is 100: " number2
#Doing the multiplying using loop
	for i in {1..1000};
	do
		if [ $i -gt $number2 ]; then
			break
		fi
		let z=$number*$i
	echo "$number * $i = $z"
done

