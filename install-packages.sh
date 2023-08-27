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
   exit 
fi
for package in $packages
do 
  P=($(yum list installed|grep -wo "$package"))
  echo "$P"
  for name in $P
  do
    echo "$name"
    if [ $name == $package ]
    then
        echo "$package is already installed"
        break
    else
       echo ""
       sudo yum install $package -y
       validate $? "$package is installed successfully" "$package is not installed __Failed"
    fi
  done
  
done
