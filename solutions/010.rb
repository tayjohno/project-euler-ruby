# frozen_string_literal: true

require './lib/taylor_math.rb'

#######################
# Problem 10          #
# ------------------- #
# Summation of Primes #
#######################
class Ten
  def initialize(n = 2_000_000)
    @n = n
  end

  def solve
    TaylorMath::Array.sum(TaylorMath.primes_less_than(@n))
  end
end
