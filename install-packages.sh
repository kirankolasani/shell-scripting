#!/bin/bash

# This is used to install packeges 

packages=("$@")
if [ -n "$packages" ]
then 
   echo "Please provide package names correctly to be installed"
   exit 1
fi
