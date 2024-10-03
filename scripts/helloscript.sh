#!/bin/bash

# Function to print "Hello" n times
print_hello() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    echo "Hello World!"
  done
}
print_hello $1
