require './lib/taylor_math.rb'

################################
# Problem 2                    #
# ---------------------------- #
# Sum of Even Fibonacci Values #
################################

def two(max_number = 4_000_000)

  # Initialize
  array = [1]
  sum = 0
  next_number = 2

  while next_number <= max_number do
    array += [next_number]
    sum += next_number if next_number.even?
    next_number += array[array.length-2]
  end

  return sum

end
