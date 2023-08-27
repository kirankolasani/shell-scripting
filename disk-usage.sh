#!/bin/bash

disk_usage_list=$(df -hT)
threashold_value="10%"
while IFS= read -r line
do 
  echo "Reading line : $line"
  usage=$(echo $line|grep -vE 'Use%'|awk '{print $6}')
  if [ $usage => $threashold_value ]
  then
      echo "$usage is greather $threashold_value"
      echo "$line"
  else
      echo "IT's Okay"
  fi
done <<< "disk_usage_list"