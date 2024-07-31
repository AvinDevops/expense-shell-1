#!/bin/bash

#set -e

# error_handler(){
#     echo -e "error line number: $R $1 $N"
#     echo -e "error description: $R $2 $N"
# }

#trap 'error_handler ${LINENO} "$BASH_COMMAND"' ERR

#Fetching userid, Timestamp, Scriptname, Logfile.
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log


#Assigning colors values to variables
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.... is $R FAILED $N"
        exit 0
    else
        echo -e "$2.... is $G SUCCESS $N"
    fi
}

#Checking root user or not
if [ $USERID -ne 0 ]
then    
    echo -e "$R you are not root user, please access with root user $N"
    exit 0
else
    echo -e "you are root user"
fi 