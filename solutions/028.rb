# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

###########################
# Problem 28              #
# ----------------------- #
# Number spiral diagonals #
###########################
class TwentyEight
  def initialize(width = 1001)
    @width = width
  end

  def solve
    max = @width**2
    sum = last = 1
    jump = 2

    while last < max
      4.times do
        last += jump
        sum += last
      end
      jump += 2
    end

    sum
  end
end
