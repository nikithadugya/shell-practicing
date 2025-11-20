#!/bin/bash

echo "please enter the number"
read NUMBER

if [ $(($NUMBER %2)) -eq 0 ]; then
    echo $NUMBER is EVEN 
else
    echo $NUMBER is ODD 
fi

