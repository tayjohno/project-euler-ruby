# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'
require './lib/taylor_math.rb'

####################
# Problem 27       #
# ---------------- #
# Quadratic primes #
####################
class TwentySeven
  extend T::Sig

  def initialize(a_max = 1000, b_max = 1000)
    @a_max = a_max
    @b_max = b_max
  end

  def solve
    primes = TaylorMath.primes_less_than(@b_max)
    a_vals = T.let(-(@a_max - 1)..(@a_max - 1), T::Enumerable[Integer])
    b_vals = T.let(primes.reverse.map(&:-@) + primes, T::Enumerable[Integer])
    max_primes = return_value = j = 0
    a_vals.each do |a|
      b_vals.each do |b|
        j += 1
        i = 0
        i += 1 while TaylorMath.prime?(i**2 + i * a + b)
        if i > max_primes
          max_primes = i
          return_value = a * b
        end
      end
    end
    return_value
  end
end
