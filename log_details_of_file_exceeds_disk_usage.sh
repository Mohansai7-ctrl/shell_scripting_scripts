

#################################
#shell script to monitor the disk usage of server. If usage exceeds 80%, log the details to a file and send an alert email.
# Author=Mohansai
# version=0.0.1

#################################
userid=$(id -u)

LOG_FOLDER="/var/log/script"
mkdir -p $LOG_FOLDER
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

CHECK(){
    if [ $userid -ne 0 ]
    then
    echo "As you are not having root access, exiting now, Please run this script with access" | tee -a $LOG_FILE
    exit 1
    else
        echo "Hurray as you are having root access, proceeding further" 
    
}

CHECK


VALIDATE(){
    if [ $1 -ne 0 ]
    echo "failed" | tee -a $LOG_FILE
    else
        echo "success"
}


# Threshold for disk usage percentage
THRESHOLD=80

# Email settings
#We need to install and configure a mail server (e.g., sendmail or mailutils) on your server.

TO_EMAIL="bandarumohansai@gmail.com"
SUBJECT="Disk Usage Alert on $(hostname)"

# Get current date and time
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Function to send an email alert
send_email_alert() {
    echo -e "Subject: $SUBJECT\n\n$1" | sendmail -t "$TO_EMAIL"
}


if [ -d $LOG_FOLDER ]
then
    echo "directory exists, hence proceeding further"
else
    echo "Directory didn't exists, make sure to provide the correct directory path"


if [[ -n $LOG_FILE ]]
then   
    echo "Log files exists which are older than