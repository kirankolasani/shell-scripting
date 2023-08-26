#!/bin/bash

Validate() {
    while true; do
        read -p "$1" value
        if [ -z "$value" ]; then
            echo "It's empty. Please enter a name."
        elif [[ ! "$value" =~ ^[a-zA-Z]+$ ]]; then
            echo "Please enter a valid string value, using only letters."
        else
            break
        fi
    done
    # Return the validated input to the caller
    eval "$2='$value'"
}

Validate "Please enter 1st Person name: " P1
Validate "Please enter 2nd Person name: " P2

echo "Hey $P1, H R U ?"
echo "Heloo $P2, I'm good what about u ?"
echo "I'm alos too good $P1"
