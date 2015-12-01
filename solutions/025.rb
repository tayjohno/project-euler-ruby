require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################

def twentyfive(digits = 1000)
  n = 1
  loop do
    fib = TaylorMath::FibonacciSequence.get_nth(n)
    return n if fib.to_s.length >= digits
    n += 1
  end
end
