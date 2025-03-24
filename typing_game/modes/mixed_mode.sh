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
        random_mixed=$(generate_random_mixed 5)
        echo "Type these characters: $random_mixed"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$random_mixed" ]]; then
            echo "Correct! You took $time_taken seconds."
            total_correct=$((total_correct + 1))
        else
            echo "Incorrect! The correct characters were $random_mixed."
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}}