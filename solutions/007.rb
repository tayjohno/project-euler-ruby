# frozen_string_literal: true

require './lib/taylor_math.rb'

#################
# Problem 7     #
# ------------- #
# 10001st prime #
#################
class Seven
  def initialize(n = 10_001)
    @n = n
  end

  def solve
    prime_count = 1
    return 0 if @n <= 0
    return 2 if @n == 1

    possible_prime = 3
    loop do
      if TaylorMath.is_prime? possible_prime
        prime_count += 1
        return possible_prime if prime_count == @n
      end
      possible_prime += 2
    end
  end
end
