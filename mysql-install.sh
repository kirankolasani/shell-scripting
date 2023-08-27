#!/bin/bash

# This script is to install mysql 
Logdir="`pwd`/../logs"
logfile=$Logdir/$0-$(date +%F).log
&>$logfile
user=$(id -u)
Validate() {
    if [ $1 == 0 ]
    then
       echo " $2 "
    else
       echo "installation is failed"
    fi
}
P=mysql
echo "$P"
#packages=($(yum list installed |grep -w "$P" | awk '{print "$P"}'))
packages=($(yum list installed | grep -wo "$P"))

for package in ${packages[@]}
do
  if [ $package == "$P" ]
  then
     echo "$P is already installed"
     exit
  fi
done

if [ $user == 0 ]
then 
   echo "this script is running under the user `id`" 
   yum insatll mysql -y 
else
  echo "This mysql installation can't be run with normal user, so running with root user" 
  sudo yum install mysql -y 
  Validate $? "mysql installed -- successfully"
fi  

#echo "mysql is installed successfully" &>>$logfile
echo $logfile