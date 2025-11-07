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

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e " Installing $2 ..... $R FAILED $N" | tee -a $Log_File
        exit 1
    else
        echo -e "Installing $2 .... $G SUCCESS $N" | tee -a $Log_File
    fi
}
dnf list installed mysql &>>$Log_File # Installed if it is not found

if [ $? -ne 0 ]; then
dnf install mysql -y
VALIDATE $1 "MYSQL"
else
    echo -e "MyQL already exist ... $Y SKIPPING INSTALLATION $N" | tee -a $Log_File
fi

dnf list installed nginx &>>$Log_File

if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $1 "NGINX"
else
    echo -e "NGINX already exist ... $Y SKIPPING INSTALLATION $N" | tee -a $Log_File
fi

dnf list installed python3 &>>$Log_File

if [ $? -ne 0 ]; then
dnf install python3 -y
VALIDATE $1 "Pythong3"
else
    echo -e "Pythong3 already exist ... $Y SKIPPING INSTALLATION $N" | tee -a $Log_File
fi



