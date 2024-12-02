#!/bin/bash

# Function to ask for a valid password
ask_for_password() {
  attempts=0
  while [ $attempts -lt 3 ]; do
    echo "Enter password: "
    read password
    if [ "$password" == "App1" ]; then
      return 0
    else
      echo "Incorrect password. Try again."
      attempts=$((attempts + 1))
    fi
  done
  echo "Access denied."
  exit 1
}

# Function to display triangular numbers
triangular_numbers() {
  echo "Enter the range for triangular numbers (e.g., 1 40):"
  read start end
  odd_count=0
  even_count=0
  odd_product=1
  even_product=1

  for ((n=1; n<=end; n++)); do
    t_n=$((n * (n + 1) / 2))
    if [ $t_n -ge $start ] && [ $t_n -le $end ]; then
      if (( t_n % 2 == 0 )); then
        echo "$t_n (Even)"
        even_count=$((even_count + 1))
        even_product=$((even_product * t_n))
      else
        echo "$t_n (Odd)"
        odd_count=$((odd_count + 1))
        odd_product=$((odd_product * t_n))
      fi
    fi
  done
  echo "Odd count: $odd_count, Even count: $even_count"
  echo "Odd product: $odd_product, Even product: $even_product"
}

# Function to find products of two successive numbers
product_of_successive_numbers() {
  echo "Enter the starting number:"
  read start
  echo "How many products to generate?"
  read count
  echo "Enter a number to check for factors:"
  read x

  for ((i=0; i<count; i++)); do
    product=$((start * (start + 1)))
    echo "Product of $start and $(($start + 1)) is $product"
    if (( x % product == 0 )); then
      echo "$product is a factor of $x."
    else
      echo "$product is not a factor of $x."
    fi
    start=$((start + 1))
  done
}

# Function to calculate the sequence
sequence_calculation() {
  echo "Enter values for a, b, and c:"
  read a b c
  echo "Enter the range [n1, n2]:"
  read n1 n2

  first_term=0
  last_term=0
  for ((n=n1; n<=n2; n++)); do
    term=$((a * n * n * n + b * n + c))
    echo "Term $n: $term"
    if [ $n -eq $n1 ]; then
      first_term=$term
    fi
    if [ $n -eq $n2 ]; then
      last_term=$term
    fi
  done
  product=$((first_term * last_term))
  echo "Product of first and last term: $product"
  if (( product % 4 == 0 )); then
    echo "The product is a multiple of 4."
  else
    echo "The product is not a multiple of 4."
  fi
}

# Main program
ask_for_password

while true; do
  echo "Choose an option:"
  echo "A) Triangular Numbers"
  echo "B) Product of Two Successive Numbers"
  echo "C) Sequence Calculation"
  echo "X) Exit"
  read choice
  case $choice in
    [Aa])
      triangular_numbers
      ;;
    [Bb])
      product_of_successive_numbers
      ;;
    [Cc])
      sequence_calculation
      ;;
    [Xx])
      echo "Exiting the program."
      exit 0
      ;;
    *)
      echo "Invalid choice, please try again."
      ;;
  esac
done
