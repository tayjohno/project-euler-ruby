# frozen_string_literal: true

require './lib/taylor_math.rb'

###############################
# Problem 25                  #
# --------------------------- #
# 1000-digit Fibonacci number #
###############################
class TwentyFive
  def initialize(digits = 1000)
    @digits = digits
  end

  def solve
    n = 1
    loop do
      fib = TaylorMath::FibonacciSequence.get_nth(n)
      return n if fib.to_s.length >= @digits

      n += 1
    end
  end
end
