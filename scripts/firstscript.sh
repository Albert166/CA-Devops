#!/bin/bash
# Count the number of files and subdirectories in directory.
find . $1 | wc -l
