#!/bin/bash

# This is a script to check if if the leter is a wover or consonant.
read -p "Please input your 1 letter in lowercase : " letter
case $letter in
	a|e|i|o|u)
		echo "This leter is a wovel"
		;;
	b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)
		echo "This letter is a consonant"
		;;
	*)
		echo "Wrong input. Start the script again with correct input"
		;;
esac
