#!/bin/bash

UserID=$(id -u)

if [ $UserID -ne 0 ]; then
    echo "ERROR :: Please run this script with ROOT Privilages"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing MySQL is FAILED"
else
    echo "Installing MySQL is SUCCESS"
fi
