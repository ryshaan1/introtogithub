#!/usr/bin/env bash

set -e

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period (years): " time

# Use awk for decimal arithmetic, which Bash itself does not support.
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p+i }')

printf "Simple interest: %s\n" "$interest"
printf "Total amount (principal + interest): %s\n" "$total"
