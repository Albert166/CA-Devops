#!/bin/bash

# Writing a function to convert the string to uppercase

STRING=$1

CONVERT() {
	x=${STRING^^}
	echo "$x"
}
CONVERT 

