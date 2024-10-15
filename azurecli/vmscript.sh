#!/bin/bash

# Script to create a VM and check it's status if it's off it should start it.

# Environment Variables

RESOURCE_GROUP="testgroup"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
COMMAND_STATUS=$?
LOG=vmscript.log
VM_NAME=scriptvm

# Function to create resource group

RESOURCE_GROUP_CREATE (){
	az group create --name $RESOURCE_GROUP --location polandcentral
}

# Function to create a VM

CREATE_VM (){
	az vm create -n $VM_NAME -g $RESOURCE_GROUP --image Ubuntu2204 --generate-ssh-k
}

# Try to start a VM

START_VM (){
	az vm start -g $RESOURCE_GROUP -n $VM_NAME
}

# Script

# Create a virtual machine with failsafe script

CREATE_VM_FINAL(){
CREATE_VM
if ($? -ne 0);then
	echo "$DATE Creating resource group $RESOURCE_GROUP" >> $LOG
	RESOURCE_GROUP_CREATE
	CREATE_VM
        echo "$DATE Created VM $VM_NAME" >> $LOG
else
	echo "$DATE Created VM $VM_NAME" >> $LOG
fi
}

# Check VM function

CHECK_VM() {
START_VM
if ($? -ne 0); then
	echo "$DATE Virtual machine is not working" >>$LOG
else
	echo "$DATE Virtual machine is working" >> $LOG
fi
}

CREATE_VM_FINAL
for (( ; ; ))
do
	CHECK_VM
	sleep 45
done

