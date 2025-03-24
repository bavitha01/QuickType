#!/bin/bash

# Function to generate a random number
generate_random_number() {
    local length=$1
    shuf -i 0-9 -n $length | tr -d '\n'
}

# Function to handle the number mode
number_mode() {
    echo "You selected: Numbers"
    echo "Type the numbers as fast as you can!"
    echo "Press Ctrl+C to exit."

    while true; do
        # Generate a random number with 5 digits
        random_number=$(generate_random_number 5)
        echo "Type this number: $random_number"

        # Record the start time
        start_time=$(date +%s)

        # Read user input
        read -p "Your input: " user_input

        # Record the end time
        end_time=$(date +%s)

        # Calculate time taken
        time_taken=$((end_time - start_time))

        # Check if the input is correct
        if [[ "$user_input" == "$random_number" ]]; then
            echo "Correct! You took $time_taken seconds."
        else
            echo "Incorrect! The correct number was $random_number."
        fi

        # Ask if the user wants to continue
        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}