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

Source_Dir=/home/ec2-user/app-logs

if [ ! -d $Source_Dir ]; then

    echo -e "ERROR:: $Source_Dir does not exist"
    exit 1

fi
Files_to_Delete=$(find $Source_Dir -name "*.log" -type f -mtime +14) 

while IFS= read -r filepath
do
    echo " Deleting the file: $filepath "
    rm -rf $filepath
    echo " Deleted the file: $filepath "
    
done <<< $Files_to_Delete
