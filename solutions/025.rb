require './lib/taylor_math.rb'

###############################
# Problem 25                  #
# --------------------------- #
# 1000-digit Fibonacci number #
###############################

def twentyfive(digits = 1000)
  n = 1
  loop do
    fib = TaylorMath::FibonacciSequence.get_nth(n)
    return n if fib.to_s.length >= digits
    n += 1
  end
end
