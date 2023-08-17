#!/bin/bash

Num1=$1
Num2=$2
Num3=$3

sum=$((Num1+Num2+Num3))

echo "numbers are : $@"
echo "count of numbers : $#"
echo "Sum of numbers is : $sum "