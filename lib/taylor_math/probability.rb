# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'

module TaylorMath
  # This class is meant to help with any common tasks involving probability.
  class Probability
    extend T::Sig

    sig { params(n: Integer, r: Integer).returns(Integer) }
    def self.ncr(n, r)
      factorial(n) / (factorial(r) * factorial(n - r))
    end

    sig { params(n: Integer, r: Integer).returns(Integer) }
    def self.npr(n, r)
      factorial(n) / factorial(n - r)
    end

    sig { params(n: Integer).returns(Integer) }
    def self.factorial(n)
      (1..n).reduce(:*) || 1
    end
  end
end
