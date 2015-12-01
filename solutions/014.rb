#
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#

require './lib/taylor_math.rb'

##############
# Problem 14 #
# ---------- #
# Large sum  #
##############

def fourteen(n = 1_000_000)
  max_length = max_i = i = step = 1
  # It seems like for any n >= 74, the answer is odd. Becuase I can't prove this however, I will leave this piece commented out.
  # step = 2 if n > 74
  while i < n
    length = TaylorMath::CoaltzSequence.length(i)
    if length > max_length
      max_length = length
      max_i = i
    end
    i += step
  end
  max_i
end
