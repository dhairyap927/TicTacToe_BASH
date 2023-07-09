#!/bin/bash

if [ "$1" == "O" ]; then
        first="$1"
        second="X"
elif [ "$1" == "X" ]; then
        first="$1"
        second="O"
else
        echo "Arg 1: Must be X or O" >&2
        exit 1
fi


#make the game board 

echo " 1 | 2 | 3 " > final_pattern
echo "-----------" >> final_pattern
echo " 4 | 5 | 6 " >> final_pattern
echo "-----------" >> final_pattern
echo " 7 | 8 | 9 " >> final_pattern

# Function to convert horizontal input to vertical
check_length() {
    file_path="$1"
    # Read the file contents into an array
    file_contents=($(<"$file_path"))
    # Loop through the array and print each element on a separate line
    for item in "${file_contents[@]}"; do
        echo "$item"
    done
}



#Function that checks if the game is over or no
winner_cases() {

        if [[ "$( cat "$1" | head -n+1 |cut -c2)" == "$first" && "$( cat "$1" | head -n+1 |cut -c6)" == "$first" && "$( cat "$1" | head -n+1 |cut -c10)" == "$first" ]]; then
                echo ""$first" is the winner"
                sed -i "s/[0-9]/\-/g" final_pattern
                cat final_pattern
                exit 4

        elif [[ "$( cat "$1" | head -n+1 |cut -c2)" == "$second" && "$( cat "$1" | head -n+1 |cut -c6)" == "$second" && "$( cat "$1" | head -n+1 |cut -c10)" == "$second"   ]]; then
                echo ""$second" is the winnner"
                sed -i "s/[0-9]/\-/g" final_pattern
                cat final_pattern
                exit 5

        else
                if [[ "$( cat "$1" | head -n+3 | tail -n-1 |cut -c2)" == "$first" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$first" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c10)" == "$first"   ]]; then
                        echo ""$first" is the winnner"
                        sed -i "s/[0-9]/\-/g" final_pattern
                        cat final_pattern
                        exit 4

                elif [[ "$( cat "$1" | head -n+3 | tail -n-1 |cut -c2)" == "$second" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$second" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c10)" == "$second"   ]]; then
                        echo ""$second" is the winnner"
                        sed -i "s/[0-9]/\-/g" final_pattern
                        cat final_pattern
                        exit 5

                else
                        if [[ "$( cat "$1" | head -n+5 | tail -n-1 |cut -c2)" == "$first" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c6)" == "$first" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c10)" == "$first"   ]]; then
                                echo ""$first" is the winnner"
                                sed -i "s/[0-9]/\-/g" final_pattern
                                cat final_pattern
                                exit 4

                        elif [[ "$( cat "$1" | head -n+5 | tail -n-1 |cut -c2)" == "$second" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c6)" == "$second" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c10)" == "$second"   ]]; then
                                echo ""$second" is the winnner"
                                sed -i "s/[0-9]/\-/g" final_pattern
                                cat final_pattern
                                exit 5

                        else

                                if [[ "$( cat "$1" | head -n+1 | tail -n-1 | cut -c2)" == "$first" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$first" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c10)" == "$first"   ]]; then
                                        echo ""$first" is the winnner"
                                        sed -i "s/[0-9]/\-/g" final_pattern
                                        cat final_pattern
                                        exit 4

                                elif [[ "$( cat "$1" | head -n+1 | tail -n-1 |cut -c2)" == "$second" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$second" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c10)" == "$second"   ]]; then
                                        echo ""$second" is the winnner"
                                        sed -i "s/[0-9]/\-/g" final_pattern
                                        cat final_pattern
                                        exit 5

                                else

                                        if [[ "$( cat "$1" | head -n+1 | tail -n-1 | cut -c10 )" == "$first" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$first" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c2)" == "$first"   ]]; then
                                                echo ""$first" is the winnner"
                                                sed -i "s/[0-9]/\-/g" final_pattern
                                                cat final_pattern
                                                exit 4

                                        elif [[ "$( cat "$1" | head -n+1 | tail -n-1 |cut -c10 )" == "$second" && "$( cat "$1" | head -n+3 | tail -n-1 |cut -c6)" == "$second" && "$( cat "$1" | head -n+5 | tail -n-1 |cut -c2)" == "$second"   ]]; then
                                                echo ""$second" is the winnner"
                                                sed -i "s/[0-9]/\-/g" final_pattern
                                                cat final_pattern
                                                exit 5
                                        else


                                                if ! grep -q "[0-9]" final_pattern; then
                                                        echo "The game is a draw"
                                                        sed -i "s/[0-9]/-/g" final_pattern
                                                        cat final_pattern
                                                        exit 6
                                                fi


                                        fi
                                fi

                        fi
                fi
        fi
}





# Function to check the length of unique integers in the input file
file_check() {
    x=$(check_length "$1" | uniq | wc -l)
    y=$(check_length "$1")
        if [ $x == 9 ]; then

                i=1

                while [ "$i" -le 9 ]; do
                        p=$(echo "$y" | head -n "$i" | tail -n 1)

                        if (("$i" % 2 != 0 )); then #ODD
                                sed -i "s/"$p"/"$first"/" final_pattern
                        elif (( "$i" % 2 == 0 )); then #EVEN
                                sed -i "s/"$p"/"$second"/" final_pattern
                        fi

                        winner_cases "final_pattern"

                        ((i++))


                done

                cat final_pattern
                rm -r final_pattern

        else
                echo " File must contain integers 1-9  "
                exit 3
        fi
}


if [ $# == 2 ]; then
    if [[ $first == "X" || $first == "O" ]]; then
        if [ -r "$2" ]; then
            file_check "$2"
        else
            echo "Arg 2: Must be a readable file" >&2
            exit 2
        fi
    else
        echo "Arg 1: Must be X or O" >&2
        exit 1
    fi
else
    echo "Exactly 2 arguments are required"
fi
