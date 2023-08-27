#!/bin/bash

# This is used to install packeges 

packages=("$@")
if [ -n $@ ]
then 
   echo "Please provide package names correctly to be installed"
   exit 1
fi
   