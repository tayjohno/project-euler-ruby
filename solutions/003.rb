require '../TaylorMath.rb'

#################################
# Problem 3                     #
# ----------------------------- #
# Find the Largest Prime Factor #
#################################

def three(number = 600851475143)

  while true do
    smallest_prime_factor = TaylorMath.smallest_prime_factor(number)

    # Stop calculation if the current largest factor is prime.
    break if number == smallest_prime_factor 

    # Divide largest factor by it's smallest prime factor.
    number = number / smallest_prime_factor
  end

  return number
  
end