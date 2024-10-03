#!/bin/bash
#Writing a script to ask for name and favourite colors.
# 1. Asking for the name

read -p "Enter your name: " name
# 2. Asking for favourite color

read -p "Enter your favourite color: " color

# Displaying this information

echo "Hello $name. Your favorite color is $color."
