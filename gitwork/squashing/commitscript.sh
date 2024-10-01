#!/bin/bash

# Commit script becouse typing is hard

for i in {11..21}; do
	echo "$i commit" >> test1.txt
	git add .
	git commit -m "$i commit"
done
