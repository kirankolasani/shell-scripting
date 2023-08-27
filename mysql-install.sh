#!/bin/bash

# This script is to install mysql 

user=$(id -u)
if [ $user == 0 ]
then 
   echo "this script is running under the user `id`"
   yum insatll mysql -y
else
  echo "This mysql installation can't be run with normal user, so running with root user"
  sudo yum install mysql -y
fi  

echo "mysql is installed successfully"