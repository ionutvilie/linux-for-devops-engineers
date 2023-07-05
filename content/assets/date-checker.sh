#!/bin/bash
# upon request :)
printf "arg 1 --> %s \n" $1

DATE=$1
HOUR=$(echo ${DATE:0:2} | sed 's/^0//')
MIN=${DATE:3:5} 
TIME=$(date +%H:%M)


printf "HH --> %s \n" $HOUR
printf "MM --> %s \n" $MINUTES
printf "MM --> %s \n" $TIME

# "08:00" - "11:59"
if [[ $HOUR -ge "8" && $HOUR -le "11" ]]
    then 
        echo "(mm) you are in time"
        if [[ $MIN -ge "00" && $MIN -le "59" ]]
            then 
            echo "(mm) you are in time"
            else
            echo "(mm) not in time"
            exit
        fi
    else
        echo "(hh) not in time"
        exit
fi
