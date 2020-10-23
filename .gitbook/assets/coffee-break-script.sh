#!/usr/bin/env bash

function script_usage {
    printf "\n"
    printf "Usage: \n" $0
    printf "  %s HH:MM \n\n" $0
    printf "Example: \n"
    printf "  %s 15:50 \n\n" $0
}

# if argument 1 is empty print script usage
if [ -z "$1" ]; 
then 
    script_usage
    printf "Error: missing requiered argument \n"
    exit 
else
    END_BREAK="$1"
fi

# a dumb data validation that won't work in high percentage of the cases 
# why ? 
if [[ ! "$END_BREAK" =~ ^[0-9]{2}:[0-9]{2}$ ]]; 
then
    script_usage 
    printf "Error: date did not passed valiadation of 99:99 :)\n" 
    exit 
fi

# endless loop 
while true; 
do 
    printf "%-10s" "$(date +'%H:%M:%S')"
    if [ "$(date +'%H:%M')" != "$END_BREAK" ]
    then 
        printf "Coffee Break Until: %-25s\n"  "${END_BREAK}"; \
    else 
        printf "Coffee Break Ended\n\n\n" 
        exit # exit loop
    fi
sleep 10 # 10 seconds
done