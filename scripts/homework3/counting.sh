#!/bin/bash

# Script that recursively counts the number of files and directories in a given directory. It uses a function  perform the counting. Directory path is passed as an argument to the script.

COUNTDIRANDFILES() {
	tree $1 | tail -1
}
COUNTDIRANDFILES "$1"
