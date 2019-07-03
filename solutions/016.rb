# frozen_string_literal: true

require './lib/taylor_math.rb'

####################
# Problem 16       #
# ---------------- #
# Power Digit Sum  #
####################
class Sixteen
  def initialize(n = 1000)
    @n = n
  end

  def solve
    TaylorMath::Array.sum((2**@n).to_s.chars.map(&:to_i))
  end
end
