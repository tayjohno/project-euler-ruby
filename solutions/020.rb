require './lib/taylor_math.rb'

#######################
# Problem 20          #
# ------------------- #
# Factorial Digit Sum #
#######################

def twenty(n = 100)
  i = n
  sum = 1
  while i > 1
    sum = i * sum
    i -= 1
  end
  TaylorMath::Array.sum(sum.to_s.split('').map(&:to_i))
end
