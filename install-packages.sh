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
echo "${packages[@]}"
for package in ${packages[@]}
do 
    echo "inside 1st for loop package : $package"
    P=($(yum list installed|grep -wo "$package"))
    echo "${P[@]}"
    if [ -n ${P[@]} ]
    then
      for name in ${P[@]}
      do
        echo " inside for loop name : $name"
        if [ $name == $package ]
        then
            echo "$package is already installed"
            break
        # else
        #     echo ""
        #     sudo yum install $package -y
        #     validate $? "$package is installed successfully" "$package is not installed __Failed"
        fi
      done
    else
        sudo yum install $package -y
        validate $? "$package is installed successfully" "$package is not installed __Failed"
    fi  
  
done

