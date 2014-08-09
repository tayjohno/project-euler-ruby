require './lib/taylor_math.rb'

#######################################
# Problem 4                           #
# ----------------------------------- #
# Find the Largest Palendrome Product #
#######################################

def four(max_number = 999)

  # Set Initial Values
  x = max_number
  max_palindrome = 0

  while x >= 1 do
    break if (x ** 2) < max_palindrome  
    y = x
    while y >= 1 do
      product = x*y
      if TaylorMath.is_palindrome(product)
        max_palindrome = product if product > max_palindrome
        break
      end
      y -= 1
    end
    x -= 1
  end
  return max_palindrome
end