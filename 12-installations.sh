#!/bin/bash

UserID=$(id -u)

if [ $UserID -ne 0 ]; then
    echo "ERROR :: Please run this script with ROOT Privilages"
    exit 1 # failure code should be other than 0
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "ERROR :: Installing $2 is FAILED"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $1 "MYSQL"


dnf install nginx -y
VALIDATE $1 "NGINX"


dnf install python3 -y
VALIDATE $1 "Pythong3"