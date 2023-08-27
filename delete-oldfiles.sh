#!/bin/bash

while IFS= read -r line
do
 echo "Reading Line : $line"
done < "/etc/passwd"