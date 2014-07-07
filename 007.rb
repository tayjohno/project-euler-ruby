=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=end

require './TaylorMath.rb'

#################
# Problem 7     #
# ------------- #
# 10001st prime #
#################

def seven(n = 10001)
  primes = 0
  return 0 if n <= 0
  i = 1
  while true
    if TaylorMath.is_prime? i
      primes += 1
      return i if primes == n
    end
    i += 1
  end 
end