#!/bin/bash

# Function to generate a mix of random numbers and letters
generate_random_mixed() {
    local length=$1
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1
}

# Function to handle the mixed mode
mixed_mode() {
    echo "You selected: Mixed (Numbers and Letters)"
    echo "Type the characters as fast as you can!"
    echo "Press Ctrl+C to exit."

    while true; do
        # Generate a random string of 5 characters (numbers and letters)
        random_mixed=$(generate_random_mixed 5)
        echo "Type these characters: $random_mixed"

        # Record the start time
        start_time=$(date +%s)

        # Read user input
        read -p "Your input: " user_input

        # Record the end time
        end_time=$(date +%s)

        # Calculate time taken
        time_taken=$((end_time - start_time))

        # Check if the input is correct
        if [[ "$user_input" == "$random_mixed" ]]; then
            echo "Correct! You took $time_taken seconds."
        else
            echo "Incorrect! The correct characters were $random_mixed."
        fi

        # Ask if the user wants to continue
        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}