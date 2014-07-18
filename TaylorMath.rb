require 'set'
#require 'profile'

module TaylorMath

  # PRIME NUMBER METHODS

  # Returns true if the number passed in is prime.
	def self.is_prime?(number)
    i = 3
    # Special cases: less than 2
    if number <= 2
      return false if number <= 1
      return true
    end
    # Return false if even
    return false if number.even?
    # Loop through all odd numbers and see if it's divisible by any
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
    return return_array.fill{ |l| return_array[l] ? l : false }.select{ |x| x }
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

  class CoaltzSequence
    @@sequence_length = {1 => 1}
    def self.next(n)
      #puts "#{n}"
      return n/2 if n.even?
      return 3*n + 1
    end
    def self.length(n)
      #puts "#{n}:\t#{@@sequence_length[n]}"
      return @@sequence_length[n] if @@sequence_length[n]
      return @@sequence_length[n] = 1 + self.length(self.next(n))
    end
  end

  class MatrixPath
    @@values_hash={}
    def self.length(width, height)
      value = 0
      if width == 0 || height == 0
        return 1
      elsif @@values_hash["#{width}x#{height}"]
        return @@values_hash["#{width}x#{height}"]
      else
        value += self.length(width-1, height)
        value += self.length(width, height-1)
        @@values_hash["#{width}x#{height}"]=value
        return value
      end
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
    def self.proper_divisors(number)
      return self.all_factors(number).delete(number)
    end
  end #END OF FACTORS CLASS


  def self.number_to_words(n)
    i = 0
    before = ""
    after = ""
    if n == 0
      return ""
    elsif n >= 1000
      i = n / 1000
      n = n % 1000
      after = " thousand"
      after += " " if n > 0
      after += "and " if n < 100 && n > 0 
    elsif n >= 100
      i = n / 100
      n = n % 100
      after = " hundred"
      after += " and " if n > 0

    elsif n >= 10
      case n
      when 10..19
        i = 0
        case n
        when 10
          return "ten"
        when 11
          return "eleven"
        when 12
          return "twelve"
        when 13
          return "thirteen"
        when 14
          return "fourteen"
        when 15
          return "fifteen"
        when 16
          return "sixteen"
        when 17
          return "seventeen"
        when 18
          return "eighteen"
        else
          return "nineteen"
        end
        n = 0
      else
        i = 0
        case n
        when 20
          return "twenty"
        when 21..29
          before = "twenty-"
        when 30
          return "thirty"
        when 31..39
          before = "thirty-"
        when 40
          return "forty"
        when 41..49
          before = "forty-"
        when 50
          return "fifty"
        when 51..59
          before = "fifty-"
        when 60
          return "sixty"
        when 61..69
          before = "sixty-"
        when 70
          return "seventy"
        when 71..79
          before = "seventy-"
        when 80
          return "eighty"
        when 81..89
          before = "eighty-"
        when 90
          return "ninety"
        else
          before = "ninety-"
        end
        n = n % 10
      end
    elsif n >= 1
      case n
      when 1
        return "one"
      when 2
        return "two"
      when 3
        return "three"
      when 4
        return "four"
      when 5
        return "five"
      when 6
        return "six"
      when 7
        return "seven"
      when 8
        return "eight"
      else
        return "nine"
      end
    end
    return before + self.number_to_words(i) + after + self.number_to_words(n)
  end
end
