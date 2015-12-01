require 'set'
require 'prime'
require './lib/taylor_math/abundance.rb'
require './lib/taylor_math/array.rb'
require './lib/taylor_math/factors.rb'
require './lib/taylor_math/triangle_sequence.rb'
require './lib/taylor_math/probability.rb'
#require 'profile'

# This module is responsible for doing all sorts of mathy things that I wanted to impliment myself.
# Some of these operations may have existing functionality in Ruby that I'm either unaware of, or
# intentionally ignoring to make my solutions more interesting.
module TaylorMath
  # This object stores a hash of numbers and for each one states whether or not that number
  # is in fact prime, for instance `{3 => true, 9 => false}`.
  @is_prime = {}

  # Returns true if the number passed in is prime.
	def self.is_prime?(number)

    # Special cases
    return true if number == 2
    return false if number.even? || number <= 1
    return @is_prime[number] if @is_prime[number]

    i = 3

    # Loop through all odd numbers and see if it's divisible by any
    while i <= Math.sqrt(number) do
      return @is_prime[number] = false if self.is_divisible_by(number, i)
      i = i + 2
    end
    return @is_prime[number] = true
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
