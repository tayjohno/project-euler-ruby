# frozen_string_literal: true

require './lib/taylor_math.rb'

#######################################
# Problem 4                           #
# ----------------------------------- #
# Find the Largest Palendrome Product #
#######################################
class Four
  def initialize(max_number = 999)
    @max_number = max_number
  end

  def solve
    # Set Initial Values
    max_palindrome = 0

    @max_number.downto(1).each do |x|
      break if (x**2) < max_palindrome

      x.downto(1).each do |y|
        product = x * y
        next unless TaylorMath.is_palindrome(product)

        max_palindrome = product if product > max_palindrome
        break
      end
    end

    max_palindrome
  end
end
