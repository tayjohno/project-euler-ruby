# frozen_string_literal: true

require './lib/taylor_math.rb'

#################################
# Problem 3                     #
# ----------------------------- #
# Find the Largest Prime Factor #
#################################
class Three
  def initialize(number = 600_851_475_143)
    @number = number
  end

  def solve
    loop do
      smallest_prime_factor = TaylorMath::Factors.smallest_prime_factor(@number)

      # Stop calculation if the current largest factor is prime.
      break if @number == smallest_prime_factor

      # Divide largest factor by it's smallest prime factor.
      @number /= smallest_prime_factor
    end

    @number
  end
end
