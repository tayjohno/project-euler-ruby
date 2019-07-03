# frozen_string_literal: true

require './lib/taylor_math.rb'

########################
# Problem 17           #
# -------------------- #
# Number Letter Counts #
########################
class Seventeen
  def initialize(n = 1000)
    @n = n
  end

  def solve
    i = 1
    sum = 0
    while i <= @n
      sum += TaylorMath.wordify(i).to_s.tr('- ', '').length
      i += 1
    end
    sum
  end
end
