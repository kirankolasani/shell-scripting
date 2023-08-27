#!/bin/bash

Validate() {
    while true; do
        read -p "$1" value
        if [ -z "$value" ]; then
            echo "It's empty. Please enter a value."
        elif [[ ! $value =~ ^[+-]?[0-9]*\.?[0-9]+$ ]]; then
            echo "Please enter a valid number value, using only numbers."
        else
            break
        fi
    done
    # Return the validated input to the caller
    eval "$2='$value'"
}

Validate "Please enter 1st number: " P1
Validate "Please enter 2nd number: " P2

result=$( echo "P1 + P2" | bc)

echo "Addition of 2 mumber is : $result "