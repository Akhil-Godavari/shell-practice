#!/bin/bash

echo " Enter the number: "
read Number

if [ $(($Number % 2)) -eq 0 ]; then
    echo " Given number $Number is EVEN"
else
    echo " Given number $Number is ODD"
fi


