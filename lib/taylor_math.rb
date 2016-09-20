require 'set'
require './lib/taylor_math/abundance.rb'
require './lib/taylor_math/array_math.rb'
require './lib/taylor_math/factors.rb'
require './lib/taylor_math/triangle_sequence.rb'
#require 'profile'

module TaylorMath

  def self.factorial(number)
    number > 1 ? number * factorial(number - 1) : 1
  end

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
  def self.primes_less_than(max)
    primes_less_than_or_equal_to(max-1)
  end

  def self.primes_less_than_or_equal_to(max)
    is_prime = Array.new((max-1)/2, true)

    for p in 0..(is_prime.length/3) do
      if is_prime[p]
        i = index_to_int(p) * 3
        step = index_to_int(p) * 2
        while i <= max do
          is_prime[int_to_index(i)] = false
          i += step
        end
      end
    end

    [2]+is_prime.fill{ |p| is_prime[p] ? index_to_int(p) : nil }.compact
  end

  def self.index_to_int i
    i * 2 + 3
  end

  def self.int_to_index i
    (i - 3)/2
  end



  # INTEGER TO STRING METHODS

  # Returns true if the number is the same in either direction in base 10.
  def self.is_palindrome(number)
    str = number.to_s
    return str.reverse == str
  end


  def self.wordify(n)
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
    return before + self.wordify(i) + after + self.wordify(n)
  end
end
