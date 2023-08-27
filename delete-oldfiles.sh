#!/bin/bash

# while IFS= read -r line
# do
#  echo "Reading Line : $line"
# done < "/etc/passwd"

Logdir="`pwd`/../logs"
Date=$(date +%F-%H)
log="$Logdir/$0-$Date.log"

old_log_files=$(find $Logdir -name "*" -type f -mtime +30)
echo "$old_log_files"

while IFS= read -r line
do 
  echo "Deleting $line"
  rm -rf $line
done < "$old_log_files"  
