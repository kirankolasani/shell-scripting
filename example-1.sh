#!/bin/bash

echo "Hello , KIran welcome to Shell scripting"

Date=$(date)

echo "Time is now : $Date"

#static Variables 
# P1=Kiran
# P2=Ram

# Dynamic variables
# P1=$1
# P2=$2

# if [ $# != 2 ]
# then 
#   echo "Plz pass 2 Args at command line"
#   echo "Usage ex: sh $0 Arg1 Arg2 "
#   exit
# fi

# Reading inputs from command propmt

# echo "Please provide 1st Person Name : "
# read P1
# echo "Please provide 2nd user name : "
# read -s P2 

## checking user enter input is not empty.


#  while true
#  do 
#    read -p "Plz enter 1st person name: " P1
#    if [ -z "$P1" ]
#    then
#        echo "It's not empty, Plz enter name again "
       
#    elif [[ ! "$P1" =~ ^[a-zA-Z]+$ ]]
#    then
#        echo "Plz enter valid string value, only letters "
#    else
#        break 
#    fi

#  done

# while true
#  do 
#    read -p "Plz enter 2nd person name: " P2
#    if [ -z "$P2" ]
#    then
#        echo "It's not empty, Plz enter name again "
       
#    else 
#        break 
#    fi

#  done

Validate(){
   read -p "$1" P1
   if [ -z "$P1" ]
   then
       echo "It's not empty, Plz enter name again "
       
   elif [[ ! "$P1" =~ ^[a-zA-Z]+$ ]]
   then
       echo "Plz enter valid string value, only letters "
   else
       break 
   fi
}

while true
do
  Validate "Please enter 1st Person name :"
  
done

echo "Hey $P1, H R U ?"
echo "Heloo $P2, I'm good what about u ?"
echo "I'm alos too good $P1"
