# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

##################
# Problem 15     #
# -------------- #
# Lattice Paths  #
##################
class Fifteen
  def initialize(width = 20, height = 20)
    @width = width
    @height = height
  end

  def solve
    TaylorMath::MatrixPath.length(@width, @height)
  end
end
