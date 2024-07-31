#!/bin/bash

source ./common.sh

#Entering password through prompt
echo "please enter password:"
read mysql_root_password

dnf install mysql-server -y &>>$LOGFILE


systemctl enable mysqld &>>$LOGFILE


systemctl start mysqld &>>$LOGFILE


# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "Setting password for root"

mysql -h db.avinexpense.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
    
else
    echo -e "Root password is already set... $Y SKIPPING $N"
fi
    
