require './lib/taylor_math.rb'

##########################################
# Problem 5                              #
# -------------------------------------- #
# Find the Least Common Multiple of 1..n #
##########################################

# Iterate on the multiple of all prime numbers below given number
# Could take further via union of all factors of all numbers, wouldn't need to do any more math.
def five(number = 20)
  least_common_multiple = 0
  primes = TaylorMath.primes_less_than(number)
  prime_product = TaylorMath::Array.product(primes)
  loop do
    least_common_multiple += prime_product
    is_divisible = true
    for i in 1..number
      is_divisible = false unless is_divisible && TaylorMath.is_divisible_by(least_common_multiple, i)
    end
    return least_common_multiple if is_divisible
  end
end

# Iterate on the multiple of the number and 1 less than the number (two largest numbers with no shared factors).
#
# def smallestDivisibleNumberNaive(number)
#   smallest_divisible = 0
#   while true
#     smallest_divisible += number*(number-1)
#     is_divisible = true
#     for i in 1..number
#       is_divisible = is_divisible && TaylorMath.is_divisible_by(smallest_divisible, i)
#     end
#     if is_divisible
#       return smallest_divisible
#     end
#   end
# end
