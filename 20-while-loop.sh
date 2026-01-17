#!/bin/bash

# count=5

# echo "Starting coutdown..."

# while [ $count -gt 0 ]
# do
#     echo "Time left: $count"
#     sleep 1 #pauses for 1 second
#     count=$((count - 1))
# done

# echo "Times UP"

while IFS= read -r line; do

    echo "Processing line: $line"


done < 16-forloop.sh
