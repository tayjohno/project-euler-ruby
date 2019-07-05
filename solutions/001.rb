# frozen_string_literal: true

require './lib/taylor_math.rb'

######################################
# Problem 1                          #
# ---------------------------------- #
# Sum of Multiples of Three and Five #
######################################
class One
  def initialize(max_number = 1_000)
    @max_number = max_number
  end

  def solve
    upto = @max_number - 1
    array = (1..(upto / 3)).map { |x| x * 3 }
    array += (1..(upto / 5)).map { |x| x * 5 }
    array.uniq!

    TaylorMath::Array.sum(array)
  end
end
