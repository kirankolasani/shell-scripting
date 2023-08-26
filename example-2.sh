#!/bin/bash

Validate() {
    while true; do
        read -p "$1" $2
        if [ -z "$2" ]; then
            echo "It's empty. Please enter a name."
        elif [[ ! "$2" =~ ^[a-zA-Z]+$ ]]; then
            echo "Please enter a valid string value, using only letters."
        else
            break
        fi
    done
}

Validate "Please enter 1st Person name: " P1
Validate "Please enter 2nd Person name: " P2

echo "Hey $P1, H R U ?"
echo "Heloo $P2, I'm good what about u ?"
echo "I'm alos too good $P1"
