require './lib/taylor_math.rb'

#####################
# Problem 23        #
# ----------------- #
# Non-Abundant Sums #
#####################


def twentythree(max=28123)
  a = (0..max).to_a
  i = 0
  j = 0
  all_abundant_numbers = TaylorMath::Abundance.all_abundant_numbers
  length = all_abundant_numbers.length

  while i < length
    while j < length
      sum = all_abundant_numbers[i]+all_abundant_numbers[j]
      if sum > 28123
        break
      else
        a[sum] = 0
        j += 1
      end
    end
    i += 1
    j = i
  end
  return TaylorMath.sum(a)
end


=begin THIS WAS A BAD IDEA

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
=end

# ANSWER: 4179871

