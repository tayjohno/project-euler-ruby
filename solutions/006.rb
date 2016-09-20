require './lib/taylor_math.rb'

#########################
# Problem 6             #
# --------------------- #
# Sum Square Difference #
#########################

# Super concise version!!
def six(max_number = 100)
  TaylorMath::Array.sum(1..max_number)**2 - TaylorMath::Array.sum((1..max_number).map { |i| i**2 })
end

## Longer, readable version
# def six(max_number = 100)
#   squared_sum = TaylorMath.sum(1..max_number) ** 2
#   summed_squares = TaylorMath.sum( (1..max_number).map { |i| i**2 } )
#   return squared_sum - summed_squares
# end
