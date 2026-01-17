#!/bin/bash

count=5

echo "Starting coutdown..."

while [ $count -gt 0 ]
do
    echo "Time left: $count"
    sleep 1 #pauses for 1 second
    count=$((count - 1))
done

echo "Times UP"

