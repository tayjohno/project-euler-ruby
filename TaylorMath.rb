require 'set'

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

  # Returns true if the numerator is evenly divisible by the denominator
  def self.is_divisible_by(numerator, denominator)
    return numerator % denominator == 0
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

  def self.count(array)
    array.length
  end

  class TriangleSequence
    @@sequence = [0]
    def self.get_nth(n)
      unless @@sequence[n]
        self.triangle_number(n, starting_number:@@sequence.length-1, starting_value:@@sequence[@@sequence.length-1])
      else
        @@sequence[n]
      end
    end
    def self.triangle_number(n, options={})
      x = options[:starting_number] || 0
      y = options[:starting_value] || 0
      while x < n do
        x += 1
        y = @@sequence[x] = @@sequence[x-1] + x
      end
      return y
    end
  end

  class Factors
    @@prime_factors = {}
    @@factors = {}

    # Returns all prime factors of a number.
    def self.prime_factors(number)
      
      return @@prime_factors[number] if @@prime_factors[number]

      return_array = []
      n = number
      i = 2
      while i <= Math.sqrt(n)  do
        i = self.smallest_prime_factor(n, i)
        return_array += [i]
        n = n / i
        if n > 1 && @@prime_factors[n]
          return_array += @@prime_factors[n]
          n = n / (TaylorMath.product(@@prime_factors[n]) || 1)
          break
        end
      end
      return_array += [n] if n != 1
      @@prime_factors[number] = return_array
      return return_array
    
    end


    # Returns the smallest prime factor of a given number
    def self.smallest_prime_factor(number, starting_point = 2)
      
      i = starting_point
      
      # Check if starting_point is a factor, and if not, continue with the next odd number.
      return i if TaylorMath.is_divisible_by(number, i)
      i += 1 if i.odd?
      i += 1

      # Loop all odd numbers starting from the smallest to see if any are prime factors (2 is the only even prime)
      while i <= Math.sqrt(number) do
        return i if TaylorMath.is_divisible_by(number, i)
        i = i + 2
      end

      return number
    end
    def self.all_factors(number)
      s1 = Set.new [1]
      self.prime_factors(number).each { |i| s1 += (s1.collect{|j| j * i}) }
      return s1
    end
  end
end
