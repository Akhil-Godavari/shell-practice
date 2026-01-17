#!/bin/bash 

UserID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"


Logs_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 )
Log_File="$Logs_Folder/$Script_Name.log"

mkdir -p $Logs_Folder
echo " Script started executing at: $(date)"

if [ $UserID -ne 0 ]; then
    echo -e "$R ERROR :: Please run this script with ROOT Privilages $N" | tee -a $Log_File
    exit 1 # failure code should be other than 0
fi

USAGE(){

    echo "USAGE:: sudo sh 21-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[OPTIONAL, default 14 days]"
    exit 1
}

if [ $# -lt 2 ];then
    USAGE
fi