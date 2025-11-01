#!/bin/bash

Start_Time=$(date +%s)
sleep 10
End_Time=$(date +%s)

Total_Time=$(($End_Time-$Start_Time))

echo "Execution time of script is: $Total_Time Seconds."