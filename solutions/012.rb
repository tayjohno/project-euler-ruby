require './TaylorMath.rb'

######################################
# Problem 12                         #
# ---------------------------------- #
# Highly Divisible Triangular Number #
######################################

def twelve(n = 500) 
  i = 1 

  # Starting with one, begin computing all triangle numbers one at a time
  while true

    # Compute next triangle, then factor it and count the factors
    triangle = TaylorMath::TriangleSequence.get_nth(i)
    factors = TaylorMath::Factors.all_factors(triangle)
    factors_count = TaylorMath.count(factors)
 
    # Check to see if completed
    return triangle if factors_count >= n

    # Increment for next loop
    i += 1
  end

end