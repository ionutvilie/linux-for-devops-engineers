#!/bin/bash
# My first script

printf "arg 0 --> %s \n" $0
printf "arg 1 --> %s \n" $1

if [ -z $1 ]; then
	echo "Name is not defined"
	exit 1
fi

printf "%s %s\n" "Hello" "$1"
