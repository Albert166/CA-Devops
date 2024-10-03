#!/bin/bash

# Mockaroo script from exercises

# Location for the data
DATA=${pwd}MOCK_DATA.csv

# Function to display all coutries in the report
COUNTRIES() {
	cat $DATA cat MOCK_DATA.csv | awk -F , '{print $5}'
}

# Function to display job titles
JOB() {
	cat $DATA | awk -F , '{print $6}'
}
# Function to get avarage salary by country
AVERAGE_COUNTRY() {i
	read -p "Please type in the country you want for your average: " country
	VALUES=("$(echo $i | grep $country | awk -F , '{print $7}')")
	while [ $VALUES -gt 0 ]; do
		for i in ${arr[$i]}
}
AVERAGE_COUNTRY
