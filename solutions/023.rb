=begin

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end
require './TaylorMath.rb'

#####################
# Problem 23        #
# ----------------- #
# Non-Abundant Sums #
#####################

def twentythree_refactoring(initial_array=((1..28123).to_a))
  input_array = initial_array
  output_array = []
  i = 0
  x = 0
  y = 0
  all_abundant_numbers = TaylorMath::Abundance.all_abundant_numbers
  max_j = max_i = all_abundant_numbers.length - 1

  while input_array.length > 0

    # Grab a number from the Array
    value = input_array.pop

    # Find closest number
    while (sum = 2 * all_abundant_numbers[max_i]) > value
      if input_array.include? sum
        input_array.delete(sum)
      else
        puts "WASTED DELETE - B"
      end
      max_i -= 1
    end
    j = i = max_i
    input_array.delete(all_abundant_numbers[i] + all_abundant_numbers[j])

    # Find a number that equals it.
    sum = 0
    while (sum = all_abundant_numbers[i] + all_abundant_numbers[j]) != value && i > 0 && j < max_j
      if input_array.include? sum
        input_array.delete(sum)
      else
        puts "WASTED DELETE - B"
      end
      if sum > value
        i -= 1
      else
        j += 1
      end
    end
    output_array.push sum unless sum == value
    puts "#{input_array.length}/#{output_array.length}"
  end
  return output_array
end

# ANSWER: 4179871  -- the below works, but takes almost 30 minutes!

def twentythree(max=28123)
  a = (1..max).to_a
  i = 0
  j = 0
  all_abundant_numbers = TaylorMath::Abundance.all_abundant_numbers
  length = all_abundant_numbers.length

  while i < length
    puts "(i:#{i},\tj:#{j}) length = #{a.length}"
    while j < length
      sum = all_abundant_numbers[i]+all_abundant_numbers[j]
      if sum > 28123
        j = length
      else
        #if a.include? sum
          a.delete sum
        #else
          #puts "WASTED DELETE"
        #end
        j += 1
      end
    end
    i += 1
    j = i
  end
  return TaylorMath.sum(a)
#  return twentythree(a)
end
