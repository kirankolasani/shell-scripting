#!/bin/bash

# This script is to install mysql 
Logdir="`pwd`/../logs"
logfile=$Logdir/$0-$(date +%F).log
user=$(id -u)
if [ $user == 0 ]
then 
   echo "this script is running under the user `id`" &>>logfile
   yum insatll mysql -y &>>logfile
else
  echo "This mysql installation can't be run with normal user, so running with root user" &>>logfile
  sudo yum install mysql -y &>>logfile
fi  

echo "mysql is installed successfully" &>>logfile