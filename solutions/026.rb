# frozen_string_literal: true

require './lib/taylor_math.rb'

#####################
# Problem 26        #
# ----------------- #
# Reciprocal cycles #
#####################
class TwentySix
  def initialize(digits = 999)
    @digits = digits
  end

  def solve
    max_length = 0
    longest_digit = 0

    (1..@digits).each do |i|
      string = TwentySix.decimal_string(1, i)
      # puts string
      if max_length < [max_length, TwentySix.loop_length(string)].max
        max_length = [max_length, TwentySix.loop_length(string)].max
        longest_digit = i
      end
    end
    longest_digit
  end

  def self.loop_length(decimal_string)
    match = /\((\d+)\)/.match(decimal_string)
    return 0 unless match

    match[1].length
  end

  def self.decimal_string(numerator, denominator)
    decimal_string = "#{numerator / denominator}."
    numerator = (numerator % denominator) * 10

    until numerator.zero? || loop_match = detect_loop(decimal_string)
      denominator.times do # Calculate out 10 numbers at a time to prevent from over-detecting
        decimal_string += (numerator / denominator).to_s
        numerator = (numerator % denominator) * 10
      end
    end

    numerator.zero? ? decimal_string.sub(/0+$/, '') : loop_format(decimal_string, loop_match)
  end

  def self.detect_loop(decimal_string)
    return false if decimal_string.length < 40

    possible_lengths = 1..(decimal_string.length / 2)
    possible_lengths.each do |loop_length|
      loop_string = decimal_string[-loop_length..-1]
      match = /(#{loop_string})+$/.match(decimal_string)
      loop_requirement = [loop_length * 2, 20].max
      # puts loop_string
      # puts match
      # puts "length: #{match.length}"
      # puts "requirement: #{loop_requirement}"
      return match if match.to_s.length > loop_requirement
    end
    false
  end

  def self.loop_format(decimal_string, loop_match)
    loop_string = /\d+/.match(loop_match.regexp.to_s).to_s
    shorten_loop(decimal_string, loop_string)
  end

  def self.shorten_loop(decimal_string, loop_string)
    decimal_string = decimal_string.sub(/(#{loop_string})+$/, '')
    decimal_string += "(#{loop_string})"
    while (match = /(\d)\(.*(\d)\)/.match(decimal_string)) && (match[1] == match[2])
      decimal_string = decimal_string.sub(/\d\(/, "(#{match[1]}")
      decimal_string = decimal_string.sub(/\d\)/, ')')
    end
    decimal_string
  end
end
