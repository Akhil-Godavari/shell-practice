#!/bin/bash

echo "All variables passed to script: $@"
echo "All variables passed to script: $*"
echo " Name of the script: $0"
echo "Current Directory: $PWD"
echo "Who is running the script: $USER"
echo "PID of the script: $$"
sleep 50 &
echo "PID of the last background process: $!"
echo "Date of execution of scrip: $date"