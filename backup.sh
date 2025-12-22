#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\[e33m"
Normal="\e[0m"



LOGS_FOLDER="/var/log/shell-practicing"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) # $0 --> Current file name  --> 14-logs
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER  # -p means if directory is not there it creates if directory is there is keeps quiet
echo "Script started executed at: $(date)" | tee -a $LOG_FILE  # tee command appends the output printing of this command on mobexterm same in LOg file as well.

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
fi

USAGE(){
    echo -e "$R USAGE::  sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS> [optional, default 14 days] $N"
    exit 1
}

###### CHeck SOURCE_DIR and DEST_DIR passed or not #########
if [ $# -lt 2 ]; then
    USAGE
fi


###### Check SOURCE_DIR Exist###########
if [ ! $SOURCE_DIR ]; then
    exho -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi


###### Check DEST Exist###########
if [ ! $DEST_DIR ]; then
    exho -e "$R Source $DEST_DIR does not exist $N"
    exit 1
fi
#######find the files##############
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

############check Archival success or not #####

if [ -f $ZIP_FILE_NAME ]
then
    echo -e "Archeival ... $G SUCCESS $N"
####Delete if success######

    while IFS=read -r filepath
    do
        echo "Deleting the file: $filepath"
        rm -rf $filepath
        echo "Deleting the file: $filepath"
    done <<< $FILES
else
    echo "Archieval... $R FAILURE $N"
    exit 1
else
    echo -e "NO files to archive... $Y SKIPPING $N"
fi







