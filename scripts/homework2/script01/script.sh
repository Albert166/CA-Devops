#!/bin/bash

# Script to select environments and use them to run the docker engine file.
#Assigning variables for the files
DEV=test.env
STAGING=test.env.dev
PRODUCTION=test.env.stage

# NodeJs Location

NODEJS=/root/nodejs

# Asking user for input
read -p "Please select the environment to start: 
1. Dev
2. Staging
3. Production
Default - Dev
E. Exit script
" input

# Running docker container based on input
case $input in
	1)
	docker run -v $NODEJS:/app -p 8089:3000 --env-file $DEV -w /app node:18 node app.js nodejs example
	;;
2)
	docker run -v $NODEJS:/app -p 8089:3000 --env-file $STAGING -w /app node:18 node app.js nodejs example
;;
3)
	docker run -v $NODEJS:/app -p 8089:3000 --env-file $PRODUCTION -w /app node:18 node app.js nodejs example
;;
*)
	docker run -v $NODEJS:/app -p 8089:3000 --env-file $DEV -w /app node:18 node app.js nodejs example
        ;;
E)
	echo "Exiting the script"
esac
