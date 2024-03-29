#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date  +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATE(){
      if [ $1 -ne 0 ]
     then
         echo -e "ERROR:: $2---- $R failed $N"
         exit 1

    else
       echo  -e "$2------  $G SUCCESS $N"

    fi
}

if [ $ID  -ne 0 ]
then

echo -e "$R ERROR:: Please run this script with root access $N" 
     exit 1 # you can give  other than 0

else
    echo "you are root user "

   fi

    yum install mysqlll  -y &>> $LOGFILE


    VALIDATE $? "Installing MYSQL"

    yum install git -y  &>> $LOGFILE


    VALIDATE $? "Installing git"