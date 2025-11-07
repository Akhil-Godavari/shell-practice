#!/bin/bash

Number=$1

if [ $Number -lt 10 ]; then
    echo "Given number $Number is less than 10"
else
    echo "Given number $Number is greater or equal to 10"
fi 

# -lt  :: less than
# -gt  :: greater than
# -eq  :: equal to
# -ne  :: not equal