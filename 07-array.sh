#!/bin/bash

Numbers=($1 $2 $3 $4 )

echo "Numbers are : ${Numbers[@]}"

for i in $Numbers
do 
   echo "number is : $i"

done