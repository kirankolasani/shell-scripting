#!/bin/bash

Numbers=($1 $2 $3 $4 )

echo "Numbers are : ${Numbers[@]}"

sum=$((Numbers[0]+Numbers[1]))

echo "Sum of first 2 numbers is : $sum"