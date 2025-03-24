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
        random_number=$(generate_random_number 5)
        echo "Type this number: $random_number"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$random_number" ]]; then
            echo "Correct! You took $time_taken seconds."
            total_correct=$((total_correct + 1))
        else
            echo "Incorrect! The correct number was $random_number."
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}