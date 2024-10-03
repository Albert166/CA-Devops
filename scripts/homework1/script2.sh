#!/bin/bash
#Second script from scripting exercises
# Variables
TIMESTAMP=$(date)
LOG=/home/albert/scripts/log/script2.log


# 1. Curl the docker container
script() {
curl --silent -o /dev/null localhost:8080

EXITCODE=$?
# Cheking if it was sucessfull and outputing command
if [[ $EXITCODE -eq 0 ]]; then
    echo "$TIMESTAMP O.K." >> $LOG
else
    echo "$TIMESTAMP Something went wrong.The exit code was $EXITCODE" >> $LOG
    fi
sleep 2
}
for i in {0..4}
do
	script
done
