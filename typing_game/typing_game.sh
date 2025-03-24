#!/bin/bash
# Global variables for scoring
total_correct=0
total_incorrect=0
total_time=0

# Source the mode scripts
source ./modes/number_mode.sh
source ./modes/letter_mode.sh
source ./modes/mixed_mode.sh
source ./modes/custom_words_mode.sh

# Function to display the welcome message
welcome_message() {
    echo "============================================"
    echo "   Welcome to the Bash Typing Game!         "
    echo "============================================"
    echo "   Practice your typing speed and accuracy. "
    echo "   Choose a mode and start typing!          "
    echo "============================================"
}

# Function to display the mode selection menu
mode_selection() {
    echo "Select a mode:"
    echo "1. Numbers"
    echo "2. Letters"
    echo "3. Mixed (Numbers and Letters)"
    echo "4. Custom Words"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice
}

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
