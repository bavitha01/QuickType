#!/bin/bash

# Function to handle the custom words mode
custom_words_mode() {
    echo "You selected: Custom Words"
    echo "Choose an option:"
    echo "1. Enter custom words manually"
    echo "2. Read words from a file"
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
                echo "File not found. Please try again."
                return
            fi
            ;;
        *)
            echo "Invalid choice. Returning to main menu."
            return
            ;;
    esac

    echo "Type the words as fast as you can!"
    echo "Press Ctrl+C to exit."

    for word in "${words[@]}"; do
        echo "Type this word: $word"

        start_time=$(date +%s)
        read -p "Your input: " user_input
        end_time=$(date +%s)
        time_taken=$((end_time - start_time))

        if [[ "$user_input" == "$word" ]]; then
            echo "Correct! You took $time_taken seconds."
            total_correct=$((total_correct + 1))
        else
            echo "Incorrect! The correct word was $word."
            total_incorrect=$((total_incorrect + 1))
        fi

        total_time=$((total_time + time_taken))

        read -p "Do you want to continue to the next word? (y/n): " continue
        if [[ "$continue" != "y" ]]; then
            break
        fi
    done
}