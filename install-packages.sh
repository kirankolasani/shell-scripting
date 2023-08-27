#!/bin/bash

# This is used to install packeges 
Logdir="`pwd`/../logs"
Date="$(date +%F-%H-%M-%S)"
logfile="$Logdir/$0-$Date.log"
packages=("$@")
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
echo -e "$R $Date $N" &>>$logfile
validate() {
    if [ $1 == 0 ];then
     echo -e "$G $2 $N" &>>$logfile
    else 
     echo -e "$R $3 $N" &>>$logfile
    fi
}
#if [ -z "$packages" ]
if [ ${#packages[@]} -eq 0 ]
then 
   echo -e " $R Please provide package names correctly to be installed $N" &>>$logfile
   exit 
fi
echo -e "$Y entered packages ${packages[@]} $N" &>>$logfile
for package in ${packages[@]}
do 
   
    P=($(yum list installed|grep -wo "$package"))
    echo "${P[@]}"
    # if [ -z ${P[@]} ]
    if [ ${#P[@]} -eq 0 ]
    then
        sudo yum install $package -y &>>$logfile
        validate $? "$package is installed successfully" "$package is not installed __Failed" &>>$logfile
    else
        for name in "${P[@]}"
        do
           
           if [ $name == $package ]
           then
                echo -e "$Y $package is already installed $N" &>>$logfile
                break
           # else
           #     echo ""
           #     sudo yum install $package -y
           #     validate $? "$package is installed successfully" "$package is not installed __Failed"
           fi
        done
        
    fi  
  
done

