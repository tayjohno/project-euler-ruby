require './TaylorMath.rb'

#######################
# Problem 10          #
# ------------------- #
# Summation of Primes #
#######################

def ten( n = 2000000 )
	TaylorMath.sum(TaylorMath.primes_less_than(n))
end
