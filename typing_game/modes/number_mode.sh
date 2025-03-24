#!/bin/bash

# Function to generate a random number
generate_random_number() {
    local length=$1
    shuf -i 0-9 -n $length | tr -d '\n'
}

# Function to handle the number mode
number_mode() {
    echo -e "${CYAN}You selected: Numbers${NC}"
    echo -e "${BLUE}Type the numbers as fast as you can!${NC}"
    echo -e "${RED}Press Ctrl+C to exit.${NC}"

    while true; do
        random_number=$(generate_random_number 5)
        echo -e "${YELLOW}Type this number: ${random_number}${NC}"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$random_number" ]]; then
            echo -e "${GREEN}Correct! You took ${time_taken} seconds.${NC}"
            total_correct=$((total_correct + 1))
        else
            echo -e "${RED}Incorrect! The correct number was ${random_number}.${NC}"
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}