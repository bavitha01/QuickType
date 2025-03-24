#!/bin/bash

# Function to generate a mix of random numbers and letters
generate_random_mixed() {
    local length=$1
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1
}

# Function to handle the mixed mode
mixed_mode() {
    echo -e "${CYAN}You selected: Mixed (Numbers and Letters)${NC}"
    echo -e "${BLUE}Type the characters as fast as you can!${NC}"
    echo -e "${RED}Press Ctrl+C to exit.${NC}"

    while true; do
        random_mixed=$(generate_random_mixed 5)
        echo -e "${YELLOW}Type these characters: ${random_mixed}${NC}"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$random_mixed" ]]; then
            echo -e "${GREEN}Correct! You took ${time_taken} seconds.${NC}"
            total_correct=$((total_correct + 1))
        else
            echo -e "${RED}Incorrect! The correct characters were ${random_mixed}.${NC}"
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}