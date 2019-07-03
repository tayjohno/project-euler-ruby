# frozen_string_literal: true

require './lib/taylor_math.rb'

#########################
# Problem 6             #
# --------------------- #
# Sum Square Difference #
#########################

# Super concise version!!
class Six
  def initialize(max_number = 100)
    @max_number = max_number
  end

  # One-line solution
  def solve
    TaylorMath::Array.sum(1..@max_number)**2 - TaylorMath::Array.sum((1..@max_number).map { |i| i**2 })
  end

  # Just a longer, readable version.
  def solve_readable
    squared_sum = TaylorMath.sum(1..max_number)**2
    summed_squares = TaylorMath.sum((1..max_number).map { |i| i**2 })
    squared_sum - summed_squares
  end
end
