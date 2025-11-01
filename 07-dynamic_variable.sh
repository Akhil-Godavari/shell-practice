#!/bin/bash

Start_Time_exe=$(date +%c)
Start_Time=$(date +%s)
echo " Start Time of the script execution: $Start_Time_exe"
sleep 10
End_Time_exe=$(date +%c)
echo " End Time of the script execution: $End_Time_exe"
End_Time=$(date +%s)

Total_Time=$(($End_Time-$Start_Time))

echo "Execution time of script is: $Total_Time Seconds."