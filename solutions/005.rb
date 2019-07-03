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
    lcm = 0 # Least Common Multiple
    primes = TaylorMath.primes_less_than(@number)
    prime_product = TaylorMath::Array.product(primes)
    loop do
      lcm += prime_product
      is_divisible = true
      (1..@number).each do |i|
        is_divisible = false unless is_divisible && TaylorMath.is_divisible_by(lcm, i)
      end
      return lcm if is_divisible
    end
  end
end

# Iterate on the multiple of the number and 1 less than the number (two largest numbers with no shared factors).
#
# def smallestDivisibleNumberNaive(number)
#   smallest_divisible = 0
#   while true
#     smallest_divisible += number*(number-1)
#     is_divisible = true
#     for i in 1..number
#       is_divisible = is_divisible && TaylorMath.is_divisible_by(smallest_divisible, i)
#     end
#     if is_divisible
#       return smallest_divisible
#     end
#   end
# end
