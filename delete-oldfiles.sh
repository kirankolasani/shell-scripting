#!/bin/bash

# while IFS= read -r line
# do
#  echo "Reading Line : $line"
# done < "/etc/passwd"

Logdir="/home/centos/logs"
Date=$(date +%F-%H)
log="$Logdir/$0-$Date.log"
echo "$Date --started script" &>>$log
old_log_files=$(find "$Logdir" -name "*" -type f -mtime +30)
echo "$old_log_files" &>>$log

while IFS= read -r line
do 
  echo "Deleting $line" &>>$log
  rm -rf "$line" &>>$log
done < "$old_log_files"  
