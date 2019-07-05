# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

################################
# Problem 2                    #
# ---------------------------- #
# Sum of Even Fibonacci Values #
################################
class Two
  def initialize(max_number = 4_000_000)
    @max_number = max_number
  end

  def solve
    array = T.let([1], T::Array[Integer])
    sum = 0
    next_number = 2

    while next_number <= @max_number
      array += [next_number]
      sum += next_number if next_number.even?
      next_number += T.must(array[array.length - 2])
    end

    sum
  end
end
