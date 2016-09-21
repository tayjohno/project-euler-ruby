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
    array = []
    threes = 3
    fives = 5

    # Get all multiples of 3 below the max
    while threes < @max_number
      array += [threes]
      threes += 3
    end

    # Get all multiples of 5 below the max (not in the list of threes).
    while fives < @max_number
      array += [fives] unless TaylorMath.is_divisible_by(fives, 3)
      fives += 5
    end

    # Return the sum of all values
    TaylorMath::Array.sum(array)
  end
end
