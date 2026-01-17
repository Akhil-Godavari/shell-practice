#!/bin/bash 

UserID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

Source_dir=$1
Dest_dir=$2
Days=${3:-14} #if not provided consider as 14 days as a default

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
## Check wheather source dir or destination dir passed in the aruguments or not 

if [ $# -lt 2 ]; then
    USAGE
fi

## checkSource dir exist or not

if [ ! -d $Source_dir ]; then
    echo -e "Source $R $Source_dir does not exist "
    exit 1
fi

#check diestination dir exist or not
if [ ! -d $Dest_dir ]; then
    echo -e "Destination $R $Dest_dir Does not exist "
    exit 1
fi

#finding the files

Files=$(find $Source_dir -name "*.log" -type f -mtime +$Days)

if [ ! -z "${Files}" ]; then
    echo "Files Found : $Files"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$Dest_dir/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $Source_dir -name "*.log" -type f -mtime +$Days | zip -@ -j "$ZIP_FILE_NAME"
    
    if [ -f $ZIP_FILE_NAME ]; then
    echo -e " $G SUCCESSFULLY ARCHIEVED $N"

    while IFS= read -r filepath
    do
    echo " Deleting the file: $filepath "
    rm -rf $filepath
    echo " Deleted the file: $filepath "

    done <<< $Files
    else
    echo -e " Archieval $R FAILURE $N "
    fi


else
    echo -e "No Files to archieve ... $Y SKIPPING $N "
fi