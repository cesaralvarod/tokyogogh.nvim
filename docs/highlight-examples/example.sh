#!/bin/bash

# Define variables
GREETING="Hello World!"
NUMBERS=(1 2 3 4 5)

# Define functions
function say_hello() {
    echo $GREETING
}

function count_numbers() {
    for n in ${NUMBERS[@]}
    do
        echo "Number: $n"
    done
}

if [ "$VAR" -eq 0 ]; then
    echo "VAR is zero"
elif [ "$VAR" -gt 0 ]; then
    echo "VAR is greater than zero"
else
    echo "VAR is less than zero"
fi

# Run functions
say_hello
count_numbers
