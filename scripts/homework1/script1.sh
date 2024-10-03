# Script 1 from exercises 
# Creating output message that the script is starting
# Creating variables
TIMESTAMP=$(date)
MESSAGE="Script is starting"
LOG=/home/albert/scripts/log/script1.log

# Creating the script starting timestamps
echo "$TIMESTAMP $MESSAGE" >> $LOG

# Checking if file run.run exists delete it if it exists or create it if it doesn't exist
if test -f /home/albert/scripts/homework1/run.run; then
	rm /home/albert/scripts/homework1/run.run
	echo "$TIMESTAMP File deleted" >> $LOG 
else
	touch /home/albert/scripts/homework1/run.run
	echo "$TIMESTAMP File created" >> $LOG 
fi
# Checking if command ran sucessfully
if [[ $? -eq 0 ]]; then
    echo "Command succeeded" >> $LOG
else
    echo "Command failed" >> $LOG
    fi
