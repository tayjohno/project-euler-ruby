require './lib/taylor_math.rb'

#################
# Problem 7     #
# ------------- #
# 10001st prime #
#################

class Seven
  def initialize(n = 10_001)
    @n = n
  end

  def solve
    primes = 1
    return 0 if @n <= 0
    return 2 if @n == 1
    i = 3
    loop do
      if TaylorMath.is_prime? i
        primes += 1
        return i if primes == @n
      end
      i += 2
    end
  end
end
