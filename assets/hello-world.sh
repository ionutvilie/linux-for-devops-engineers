#!/usr/bin/env bash
message="Hello World"

printf "with printf: %s\n" "${message}" # POSIX Way
echo   "with echo: ${message}"          # Not portable