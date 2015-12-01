require './lib/taylor_math.rb'

#######################
# Problem 10          #
# ------------------- #
# Summation of Primes #
#######################

def ten(n = 2_000_000)
  TaylorMath::Array.sum(TaylorMath.primes_less_than(n))
end
