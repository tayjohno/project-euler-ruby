# frozen_string_literal: true

require './lib/taylor_math.rb'

####################
# Problem 21       #
# ---------------- #
# Amicable Numbers #
####################
class TwentyOne
  def initialize(n = 10_000)
    @n = n
  end

  def solve
    i = 2
    return_sum = 0
    while i < @n
      divisor_sum = TaylorMath::Array.sum(TaylorMath::Factors.proper_divisors(i))
      if i != divisor_sum && i == TaylorMath::Array.sum(TaylorMath::Factors.proper_divisors(divisor_sum))
        return_sum += i
      end
      i += 1
    end
    return_sum
  end
end
