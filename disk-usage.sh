#!/bin/bash

disk_usage_list=$(df -hT)
threashold_value="10%"
message="$0.log"
while IFS= read -r line
do 
#   echo "Reading line : $line"
  usage=$(echo "$line" | grep -vE 'Use%' | awk '{print $6}')
  if [ -n "$usage" ]; then

    usage_percentage="${usage%\%}"  # Remove '%' from the usage value
    
    if [ "$usage_percentage" -ge "${threashold_value%\%}" ]
    then
      echo "$usage is greather $threashold_value" &>>$message
      echo "$(df -hT|grep "Use%")" &>>$message
      echo "$line" &>>$message
      echo "$message" | mail -s "High Disk Usgae Alert" "kirankumark906@gmail.com"
    fi
  fi  
done <<< "$disk_usage_list"