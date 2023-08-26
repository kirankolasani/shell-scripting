#!/bin/bash

Validate() {
    while true; do
        read -p "$1" P1
        if [ -z "$P1" ]; then
            echo "It's empty. Please enter a name."
        elif [[ ! "$P1" =~ ^[a-zA-Z]+$ ]]; then
            echo "Please enter a valid string value, using only letters."
        else
            break
        fi
    done
}

Validate "Please enter 1st Person name: "

echo "Hey $P1, how are you?"
