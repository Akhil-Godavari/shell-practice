#!/bin/bash
set -e 

error(){
    echo "There is an error"

}

trap error ERR

echo "Hello..."
echo "Before error..."
ndkjfnajk;dnf # how shell understands there is an error and signal is ERR
echo "After Error..."