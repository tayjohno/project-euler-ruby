# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'
require './lib/taylor_math.rb'

#######################
# Problem 20          #
# ------------------- #
# Factorial Digit Sum #
#######################
class Twenty
  extend T::Sig

  sig { params(n: Integer).void }
  def initialize(n = 100)
    @n = T.let(n, Integer)
  end

  sig { returns(Integer) }
  def solve
    i = @n
    sum = 1
    while i > 1
      sum = i * sum
      i -= 1
    end
    TaylorMath::Array.sum(sum.to_s.split('').map(&:to_i))
  end
end
