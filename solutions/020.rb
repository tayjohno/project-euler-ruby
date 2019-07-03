# frozen_string_literal: true

require './lib/taylor_math.rb'

#######################
# Problem 20          #
# ------------------- #
# Factorial Digit Sum #
#######################
class Twenty
  def initialize(n = 100)
    @n = n
  end

  def solve
    i = @n
    sum = 1
    while i > 1
      sum = i * sum
      i -= 1
    end
    TaylorMath::Array.sum(sum.to_s.split('').map(&:to_i))
  end
end
