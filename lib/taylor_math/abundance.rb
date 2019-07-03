# frozen_string_literal: true

module TaylorMath
  # This class is meant to help deal with abundance problems.
  #
  # A number n is called deficient if the sum of its proper divisors is less than n and it is called
  # abundant if this sum exceeds n.
  class Abundance
    @all_abundant_numbers = nil
    def self.all_abundant_numbers
      return @all_abundant_numbers if @all_abundant_numbers

      @all_abundant_numbers = []
      i = 12
      while i < 28_123
        @all_abundant_numbers.push i if abundance(i) > 0
        i += 1
      end
      @all_abundant_numbers
    end

    def self.abundance(i)
      TaylorMath::Array.sum(TaylorMath::Factors.proper_divisors(i)) - i
    end
  end
end
