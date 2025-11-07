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
        echo -e "Installing $2 .... $G SUCCESS $N"
    fi
}
dnf list installed mysql # Installed if it is not found

if [ $? -ne 0 ]; then
dnf install mysql -y
VALIDATE $1 "MYSQL"
else
    echo -e "MyQL already exist ... $Y SKIPPING INSTALLATION $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $1 "NGINX"
else
    echo -e "NGINX already exist ... $Y SKIPPING INSTALLATION $N"
fi

dnf list installed python3

if [ $? -ne 0 ]; then
dnf install python3 -y
VALIDATE $1 "Pythong3"
else
    echo -e "Pythong3 already exist ... $Y SKIPPING INSTALLATION $N"
fi