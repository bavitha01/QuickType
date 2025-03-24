#!/bin/bash

# Function to generate a random letter
generate_random_letter() {
    local length=$1
    cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w $length | head -n 1
}

# Function to handle the letter mode
letter_mode() {
    echo "You selected: Letters"
    echo "Type the letters as fast as you can!"
    echo "Press Ctrl+C to exit."

    while true; do
        # Generate a random string of 5 letters
        random_letters=$(generate_random_letter 5)
        echo "Type these letters: $random_letters"

        # Record the start time
        start_time=$(date +%s)

        # Read user input
        read -p "Your input: " user_input

        # Record the end time
        end_time=$(date +%s)

        # Calculate time taken
        time_taken=$((end_time - start_time))

        # Check if the input is correct
        if [[ "$user_input" == "$random_letters" ]]; then
            echo "Correct! You took $time_taken seconds."
        else
            echo "Incorrect! The correct letters were $random_letters."
        fi

        # Ask if the user wants to continue
        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}