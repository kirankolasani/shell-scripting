#!/bin/bash

# This is used to install packeges 

packages=("$@")
validate() {
    if [ $1 == 0 ];then
     echo "$2"
    else 
     echo "$3" 
    fi
}
if [ -z "$packages" ]
then 
   echo "Please provide package names correctly to be installed"
   exit 1
fi
for package in $packages
P=($(yum list installed|grep -wo "$package"))
do 
  for name in $P
  do
    if [ $name == $package ]
    then
        echo "$package is already installed"
        break
    else
       sudo yum install $package -y
       validate $? "$package is installed successfully" "$package is not installed __Failed"
    fi
  done
  
done
