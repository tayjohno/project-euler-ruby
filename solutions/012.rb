# frozen_string_literal: true

require './lib/taylor_math.rb'

######################################
# Problem 12                         #
# ---------------------------------- #
# Highly Divisible Triangular Number #
######################################
class Twelve
  def initialize(n = 500)
    @n = n
  end

  def solve
    i = 1

    # Starting with one, begin computing all triangle numbers one at a time
    loop do
      # Compute next triangle, then factor it and count the factors
      triangle = TaylorMath::TriangleSequence.get_nth(i)
      factors = TaylorMath::Factors.all_factors(triangle)
      factors_count = factors.count

      # Check to see if completed
      return triangle if factors_count >= @n

      # Increment for next loop
      i += 1
    end
  end
end
