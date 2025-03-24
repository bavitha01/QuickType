#!/bin/bash
# Global variables for scoring
total_correct=0
total_incorrect=0
total_time=0

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (reset)

# Source the mode scripts
source ./modes/number_mode.sh
source ./modes/letter_mode.sh
source ./modes/mixed_mode.sh
source ./modes/custom_words_mode.sh

# Function to display the welcome message
welcome_message() {
    echo -e "${CYAN}============================================${NC}"
    echo -e "${YELLOW}   Welcome to the Bash Typing Game!         ${NC}"
    echo -e "${CYAN}============================================${NC}"
    echo -e "${BLUE}   Practice your typing speed and accuracy. ${NC}"
    echo -e "${BLUE}   Choose a mode and start typing!          ${NC}"
    echo -e "${CYAN}============================================${NC}"
}

# Function to display the mode selection menu
mode_selection() {
    echo -e "${MAGENTA}Select a mode:${NC}"
    echo -e "${GREEN}1. Numbers${NC}"
    echo -e "${GREEN}2. Letters${NC}"
    echo -e "${GREEN}3. Mixed (Numbers and Letters)${NC}"
    echo -e "${GREEN}4. Custom Words${NC}"
    echo -e "${RED}5. Exit${NC}"
    read -p "Enter your choice (1-5): " choice
}
display_score() {
    echo -e "${CYAN}============================================${NC}"
    echo -e "${YELLOW}   Game Over! Here's your performance:      ${NC}"
    echo -e "${CYAN}============================================${NC}"

    total_attempts=$((total_correct + total_incorrect))

    if [[ $total_attempts -eq 0 ]]; then
        echo -e "${RED}No attempts were made.${NC}"
        return
    fi

    # Calculate accuracy
    accuracy=$((total_correct * 100 / total_attempts))
    echo -e "${GREEN}Accuracy: ${accuracy}% ($total_correct correct out of $total_attempts)${NC}"

    # Calculate average typing speed (characters per second)
    if [[ $total_time -gt 0 ]]; then
        total_characters=$((total_attempts * 5))  # Assuming 5 characters per round
        average_speed=$((total_characters / total_time))
        echo -e "${GREEN}Average typing speed: ${average_speed} characters per second${NC}"
    else
        echo -e "${RED}Average typing speed: N/A (no time recorded)${NC}"
    fi

    echo -e "${CYAN}============================================${NC}"
}
# Function to handle graceful exit
cleanup_and_exit() {
    echo -e "\n${RED}Exiting the game. Goodbye!${NC}"
    reset  # Reset the terminal (optional, ensures the terminal is clean)
    exit 0
}
# Trap SIGINT (Ctrl+C) and call cleanup_and_exit
trap cleanup_and_exit SIGINT
# Main game loop
main() {
    welcome_message
    mode_selection

    case $choice in
        1) number_mode ;;
        2) letter_mode ;;
        3) mixed_mode ;;
        4) custom_words_mode ;;
        5) echo "Exiting the game. Goodbye!" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    # Display the user's score
    display_score
}
main
