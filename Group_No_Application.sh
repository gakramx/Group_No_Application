#!/bin/bash

# Simple secure access script with multiple mathematical utilities
# Useful for educational or personal calculation tasks

# Limit login attempts to prevent brute force
ask_for_password() {
  attempts=0
  while [ $attempts -lt 3 ]; do
    echo "Enter password: "
    read -s password  # Use -s to hide password input
    
    # Basic password check (replace with more secure method in production)
    if [ "$password" == "App1" ]; then
      return 0
    else
      echo "Incorrect password. Please try again."
      attempts=$((attempts + 1))
    fi
  done
  
  echo "Too many failed attempts. Access denied."
  exit 1
}

# Generate and analyze triangular numbers within a given range
triangular_numbers() {
  echo "Enter the range for triangular numbers (start end):"
  read start end
  
  odd_count=0
  even_count=0
  odd_product=1
  even_product=1
  
  for ((n=1; n<=end; n++)); do
    # Classic triangular number formula: n(n+1)/2
    t_n=$((n * (n + 1) / 2))
    
    # Check if within specified range
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
  
  echo "Triangular Number Summary:"
  echo "  Odd Count: $odd_count"
  echo "  Even Count: $even_count"
  echo "  Odd Product: $odd_product"
  echo "  Even Product: $even_product"
}

# Calculate products of consecutive numbers
product_of_successive_numbers() {
  echo "Enter the starting number:"
  read start
  
  echo "How many product sequences to generate?"
  read count
  
  echo "Enter a reference number to check divisibility:"
  read x
  
  for ((i=0; i<count; i++)); do
    product=$((start * (start + 1)))
    
    echo "Numbers: $start and $(($start + 1))"
    echo "Their product: $product"
    
    if (( x % product == 0 )); then
      echo "✓ $product is a factor of $x"
    else
      echo "✗ $product is not a factor of $x"
    fi
    
    start=$((start + 1))
  done
}

# Polynomial sequence calculator with interesting properties
sequence_calculation() {
  echo "Enter coefficients a, b, c for polynomial n³ + bn + c:"
  read a b c
  
  echo "Specify sequence range (start end):"
  read n1 n2
  
  first_term=0
  last_term=0
  
  for ((n=n1; n<=n2; n++)); do
    # Cubic sequence: a*n³ + b*n + c
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
  
  echo "First and Last Term Product: $product"
  
  if (( product % 4 == 0 )); then
    echo "Interesting: The product is divisible by 4!"
  else
    echo "The product is not divisible by 4."
  fi
}

# Main program loop
main() {
  # Initial password protection
  ask_for_password
  
  while true; do
    echo "Mathematical Utilities Menu:"
    echo "A) Triangular Numbers"
    echo "B) Successive Number Products"
    echo "C) Sequence Analysis"
    echo "X) Exit Program"
    
    read -p "Choose an option: " choice
    
    case ${choice^^} in  # Case-insensitive input
      A) triangular_numbers ;;
      B) product_of_successive_numbers ;;
      C) sequence_calculation ;;
      X) 
        echo "Goodbye!"
        exit 0 
        ;;
      *) 
        echo "Invalid option. Try again." 
        ;;
    esac
  done
}

# Start the program
main
