#!/bin/bash

# This is used to install packeges 

packages=("$@")
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

validate() {
    if [ $1 == 0 ];then
     echo -e "$G $2 $N"
    else 
     echo -e "$R $3 $N" 
    fi
}
#if [ -z "$packages" ]
if [ ${#packages[@]} -eq 0 ]
then 
   echo -e " $R Please provide package names correctly to be installed $N"
   exit 
fi
echo "${packages[@]}"
for package in ${packages[@]}
do 
    echo "inside 1st for loop package : $package"
    P=($(yum list installed|grep -wo "$package"))
    echo "${P[@]}"
    # if [ -z ${P[@]} ]
    if [ ${#P[@]} -eq 0 ]
    then
        sudo yum install $package -y
        validate $? "$package is installed successfully" "$package is not installed __Failed"
    else
        for name in "${P[@]}"
        do
           echo " inside for loop name : $name"
           if [ $name == $package ]
           then
                echo -e "$Y $package is already installed $N"
                break
           # else
           #     echo ""
           #     sudo yum install $package -y
           #     validate $? "$package is installed successfully" "$package is not installed __Failed"
           fi
        done
        
    fi  
  
done

