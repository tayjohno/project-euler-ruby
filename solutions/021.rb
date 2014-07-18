require './TaylorMath.rb'

####################
# Problem 21       #
# ---------------- #
# Amicable Numbers #
####################

def twentyone(n = 10000)
  i = 2
  return_sum = 0
  while i < n
    divisor_sum = TaylorMath.sum(TaylorMath::Factors.proper_divisors(i))
    if i != divisor_sum && i == TaylorMath.sum(TaylorMath::Factors.proper_divisors(divisor_sum))
      return_sum += i
    end
    i += 1
  end
  return_sum
end
