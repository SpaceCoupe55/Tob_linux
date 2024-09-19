#!/bin/bash

# Function to display the animation of the calculator starting up
function ascii_animation() {
    frames=(
    ".-----------------------------.
| # Texas Instruments   TI-82  |
| .                             |
| |                             |
| |                             |
| |                             |
| |                             |
| '                             |
|                               |
'-----------------------------'"
    ".-----------------------------.
| # Texas Instruments   TI-82  |
| .-------------------------.  |
| |            ./           |  |
| |                         |  |
| |                         |  |
| |                         |  |
| '-------------------------'  |
|                               |
'-----------------------------'"
    ".-----------------------------.
| # Texas Instruments   TI-82  |
| .-------------------------.  |
| |            ./           |  |
| |            +            |  |
| |                         |  |
| |                         |  |
| '-------------------------'  |
|                               |
'-----------------------------'"
    ".-----------------------------.
| # Texas Instruments   TI-82  |
| .-------------------------.  |
| |            ./           |  |
| |            +            |  |
| |. . . . . ./. . . . . . .|  |
| |                         |  |
| '-------------------------'  |
|                               |
'-----------------------------'"
    ".-----------------------------.
| # Texas Instruments   TI-82  |
| .-------------------------.  |
| |            ./           |  |
| |            +            |  |
| |. . . . . ./. . . . . . .|  |
| |          / .            |  |
| | X=5.2   /  .   Y=0      |  |
| '-------------------------'  |
| [Y=][WIN][ZOOM][TRACE][GRH]   |
|                  _ [ ^ ] _    |
| [2nd][MODE][DEL]|_|     |_|   |
| [ALP][XTO][STAT]   [ V ]      |
| [MATH][MAT][PGM][VARS][CLR]   |
| [x-1] [SIN] [COS] [TAN] [^]   |
|  [x2][ , ][ ( ][ ) ][ / ]     |
| [LOG][ 7 ][ 8 ][ 9 ] [ X ]    |
| [LN ][ 4 ][ 5 ][ 6 ] [ - ]    |
| [STO>][ 1 ][ 2 ][ 3 ][ + ]    |
| [ON][ 0 ][ . ][ (-) ][ENTR]   |
| ----                          |
'-----------------------------'"
    )

    for frame in "${frames[@]}"; do
        clear
        echo "$frame"
        sleep 0.5
    done
}

# Function to display the calculator menu
function calculator_menu() {
    echo "Choose an operation:"
    echo "1) Addition (+)"
    echo "2) Subtraction (-)"
    echo "3) Multiplication (*)"
    echo "4) Division (/)"
    echo "5) Exit"
}

# Function to perform the calculation
function perform_calculation() {
    case $operation in
        1)
            result=$((num1 + num2))
            echo "Result: $num1 + $num2 = $result"
            ;;
        2)
            result=$((num1 - num2))
            echo "Result: $num1 - $num2 = $result"
            ;;
        3)
            result=$((num1 * num2))
            echo "Result: $num1 * $num2 = $result"
            ;;
        4)
            if [ $num2 -ne 0 ]; then
                result=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Result: $num1 / $num2 = $result"
            else
                echo "Error: Division by zero is not allowed."
            fi
            ;;
        5)
            echo "Exiting the calculator. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
}

# Main program loop
ascii_animation
while true; do
    calculator_menu
    read -p "Enter your choice: " operation
    
    if [ "$operation" -eq 5 ]; then
        perform_calculation
        break
    fi
    
    read -p "Enter the first number: " num1
    read -p "Enter the second number: " num2

    perform_calculation
done

