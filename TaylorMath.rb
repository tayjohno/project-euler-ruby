module TaylorMath

  # PRIME NUMBER METHODS

  # Returns true if the number passed in is prime.
	def self.is_prime?(number)
    i = 2
    if number <= 2
      return false if number <= 1
      return true
    end
    i += 1 
    while i <= Math.sqrt(number) do
      return false if self.is_divisible_by(number, i)
      i = i + 2
    end
    return true
	end


  # Returns the smallest prime factor of a given number
  def self.smallest_prime_factor(number, starting_point = 2)
    
    i = starting_point
    
    # Check if starting_point is a factor, and if not, continue with the next odd number.
    return i if self.is_divisible_by(number, i)
    i += 1 if i.odd?
    i += 1

    # Loop all odd numbers starting from the smallest to see if any are prime factors (2 is the only even prime)
    while i <= Math.sqrt(number) do
      return i if self.is_divisible_by(number, i)
      i = i + 2
    end

    return number
  end


  # Returns true if the numerator is evenly divisible by the denominator
  def self.is_divisible_by(numerator, denominator)
    return numerator % denominator == 0
  end


  # Returns all prime factors of a number.
  def self.prime_factors(number)
    return_array = []
    i = 2
    while i <= Math.sqrt(number)  do
      i = self.smallest_prime_factor(number, i)
      return_array += [i]
      number = number / i
    end
    return_array += [number] if number != 1
    return return_array
  end


  # Returns all prime factors of a number.
  def self.primes_less_than(number)
    return_array = [false, false]
    for i in 2..(number-1) do
      if return_array[i] == nil
        return_array[i] = true
        j = i * 2
        while j < number do
          return_array[j] = false
          j += i
        end
      end
    end
    return return_array.fill{ |i| return_array[i] ? i : false }.select{ |x| x }
  end



  # INTEGER TO STRING METHODS

  # Returns true if the number is the same in either direction in base 10.
  def self.is_palindrome(number)
    str = number.to_s
    return str.reverse == str
  end



  # INTEGER ARRAY FUNCTIONS

  def self.sum(array)
    array.inject{ |sum, el| sum + el }
  end

  def self.product(array)
    array.inject{ |product, el| product * el }
  end
end
