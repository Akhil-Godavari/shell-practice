#!/bin/bash

UserID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

if [ $UserID -ne 0 ]; then
    echo -e "$R ERROR :: Please run this script with ROOT Privilages $N"
    exit 1 # failure code should be other than 0
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e " Installing $2 ..... $R FAILED $N"
        exit 1
    else
        echo "Installing $2 .... $G SUCCESS $N"
    fi
}

dnf install mysql -y
VALIDATE $1 "MYSQL"


dnf install nginx -y
VALIDATE $1 "NGINX"


dnf install python3 -y
VALIDATE $1 "Pythong3"