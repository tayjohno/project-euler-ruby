# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

module TaylorMath
  # This class is meant to help deal with abundance problems.
  #
  # A number n is called deficient if the sum of its proper divisors is less than n and it is called
  # abundant if this sum exceeds n.
  class Abundance
    extend T::Sig

    @all_abundant_numbers = T.let(nil, T.nilable(T::Array[Integer]))

    sig { returns(T::Array[Integer]) }
    def self.all_abundant_numbers
      return @all_abundant_numbers unless @all_abundant_numbers.nil?

      @all_abundant_numbers = calculate_abundant_numbers
    end

    sig { returns(T::Array[Integer]) }
    def self.calculate_abundant_numbers
      [].tap do |abundant_numbers|
        (12..28_123).each do |i|
          abundant_numbers.push i if abundance(i).positive?
        end
      end
    end

    sig { params(i: Integer).returns(Integer) }
    def self.abundance(i)
      TaylorMath::Array.sum(TaylorMath::Factors.proper_divisors(i)) - i
    end
  end
end
