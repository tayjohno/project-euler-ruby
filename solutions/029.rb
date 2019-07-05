# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

###################
# Problem 29      #
# --------------- #
# Distinct powers #
###################
class TwentyNine
  def initialize(max_base = 100, max_exponent = 100)
    @max_base = max_base
    @max_exponent = max_exponent
  end

  # FIXME: naiive approach--could easily be optimized
  def solve
    Array.new((@max_base - 1) * (@max_exponent - 1))
         .each_with_index
         .map { |_val, index| value_for_array_index(index) }
         .uniq
         .count
  end

  def value_for_array_index(index)
    base = index / (@max_base - 1) + 2
    exponent = index % (@max_base - 1) + 2
    base**exponent
  end
end
