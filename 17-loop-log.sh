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

for package in $@
do 
    # Check package is already installed or not
    dnf list install $package &>>$Log_File

    #if exit status is 0, already installed. -ne o need to install 
    if [ $? -ne 0 ]; then
        dnf install $package -y  &>>$Log_File
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $Y SKIPPING $N "
    fi
done