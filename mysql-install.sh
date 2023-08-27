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
Install_validate() {

}
packages=$((yum list instlled |grep -w "mysql" | awk '{print "mysql"}' ))
for package in ${packages[@]}
do
  if [ $package == "mysql" ]
  then
     echo "$package is already installed"
  else
     echo "$package is not yet installed , So procccding with installation"
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