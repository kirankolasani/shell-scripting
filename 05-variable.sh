#!/bin/bash

R=\e[31m
G=\e[32m
N=\e[0m

echo "Please enter user name : "
read -s user

echo "Plz enter password : "
read -s pwd

echo "Ur username is : $G $user $N"

echo "Ur password is : $R $pwd $N"