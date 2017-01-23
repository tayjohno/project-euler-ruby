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

  # This was my first solution, and it works, but it ended up being an O(N^2), while the above
  # solution is only an O(N).
  def solve_slow
    array = []
    multiple_of_three = 3
    multiple_of_five = 5

    # Get all multiples of 3 below the max
    while multiple_of_three < @max_number
      array += [multiple_of_three]
      multiple_of_three += 3
    end

    # Get all multiples of 5 below the max (not in the list of threes).
    while multiple_of_five < @max_number
      array += [multiple_of_five] unless TaylorMath.is_divisible_by(multiple_of_five, 3)
      multiple_of_five += 5
    end

    # Return the sum of all values
    TaylorMath::Array.sum(array)
  end
end
