#!/bin/bash

# Function to handle the custom words mode
custom_words_mode() {
    echo -e "${CYAN}You selected: Custom Words${NC}"
    echo -e "${BLUE}Choose an option:${NC}"
    echo -e "${GREEN}1. Enter custom words manually${NC}"
    echo -e "${GREEN}2. Read words from a file${NC}"
    read -p "Enter your choice (1-2): " custom_choice

    case $custom_choice in
        1)
            # Manual input
            read -p "Enter a list of words (separated by spaces): " custom_words
            words=($custom_words)
            ;;
        2)
            # Read from a file
            read -p "Enter the path to the file containing words: " file_path
            if [[ -f "$file_path" ]]; then
                words=($(cat "$file_path"))
            else
                echo -e "${RED}File not found. Please try again.${NC}"
                return
            fi
            ;;
        *)
            echo -e "${RED}Invalid choice. Returning to main menu.${NC}"
            return
            ;;
    esac

    echo -e "${BLUE}Type the words as fast as you can!${NC}"
    echo -e "${RED}Press Ctrl+C to exit.${NC}"

    for word in "${words[@]}"; do
        echo -e "${YELLOW}Type this word: ${word}${NC}"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$word" ]]; then
            echo -e "${GREEN}Correct! You took ${time_taken} seconds.${NC}"
            total_correct=$((total_correct + 1))
        else
            echo -e "${RED}Incorrect! The correct word was ${word}.${NC}"
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue to the next word? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}