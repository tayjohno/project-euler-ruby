# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

##########################################
# Problem 5                              #
# -------------------------------------- #
# Find the Least Common Multiple of 1..n #
##########################################
class Five
  def initialize(number = 20)
    @number = number
  end

  # Iterate on the multiple of all prime numbers below given number
  # Could take further via union of all factors of all numbers, wouldn't need to do any more math.
  def solve
    primes = TaylorMath.primes_less_than(@number)
    # We know that the answer will be a multiple of this value
    prime_product = TaylorMath::Array.product(primes)
    (1..Float::INFINITY).each do |n|
      lcm_candidate = n * prime_product
      return lcm_candidate if (1..@number).all? do |i|
        TaylorMath.is_divisible_by(lcm_candidate, i)
      end
    end
  end
end
