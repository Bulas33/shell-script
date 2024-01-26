#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date  +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started excuting at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [$1 -ne 0]
    then
       echo -e "$2...$R FAILED $N"
    else
     echo -e "$2...$G SUCCESS $N"
    
    fi
}

if [ $ID  -ne 0 ]
then

echo -e "$R ERROR:: Please run this script with root access $N" 
     exit 1 # you can give  other than 0

else
    echo "you are root user "

   fi
    #echo "All arguments are passed: $@"
    for package in $@
    do
         yum installed $package &>> $LOGFILE                           
         if [$? -ne 0]
        then
           yum installed $package -y &>> $LOGFILE
           VALIDATE $? "Installation of $package"
           else
              echo -e "$package is already installed ...$Y Skipping $N"
              fi
              
             done