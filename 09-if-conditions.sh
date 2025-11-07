#!/bin/bash

Number=$1

if [ $Number -lt 10 ]; then
    echo "Given number $Number is less than 10"
elif [ $Number -eq 10 ]; then
    echo "Given Number $Number is qual to 10"
else
    echo "Given number $Number is greater 10"
fi 

# -lt  :: less than
# -gt  :: greater than
# -eq  :: equal to
# -ne  :: not equal