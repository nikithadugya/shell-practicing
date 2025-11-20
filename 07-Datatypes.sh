#!/bin/bash

#everything in shell is considered as string but internally it analyses  if its addition or multiplication as numbers
NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))  # 300

echo "SUM is:$SUM"
