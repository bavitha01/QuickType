#!/bin/bash

# Function to generate a random letter
generate_random_letter() {
    local length=$1
    cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w $length | head -n 1
}

# Function to handle the letter mode
letter_mode() {
    echo -e "${CYAN}You selected: Letters${NC}"
    echo -e "${BLUE}Type the letters as fast as you can!${NC}"
    echo -e "${RED}Press Ctrl+C to exit.${NC}"

    while true; do
        random_letters=$(generate_random_letter 5)
        echo -e "${YELLOW}Type these letters: ${random_letters}${NC}"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$random_letters" ]]; then
            echo -e "${GREEN}Correct! You took ${time_taken} seconds.${NC}"
            total_correct=$((total_correct + 1))
        else
            echo -e "${RED}Incorrect! The correct letters were ${random_letters}.${NC}"
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}