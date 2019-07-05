# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'

module TaylorMath
  # This math library is made to deal with Factors (or numbers that evenly divide other numbers).
  class Factors
    extend T::Sig

    @prime_factors = T.let({}, T::Hash[Integer, T::Array[Integer]])

    # Returns all prime factors of a number.
    sig { params(number: Integer).returns(T::Array[Integer]) }
    def self.prime_factors(number)
      return T.must(@prime_factors[number]) unless @prime_factors[number].nil?

      return_array = T.let([], T::Array[Integer])
      n = number
      i = 2

      # Largest possible factor is self, 2nd largest is sqrt(self).
      while i <= Math.sqrt(n)
        i = smallest_prime_factor(n, i)
        return_array += [i]
        n /= i
        next unless n > 1 && @prime_factors[n]

        return_array += T.must(@prime_factors[n])
        n /= TaylorMath::Array.product(T.must(@prime_factors[n]))
        break
      end

      return_array += [n] if n != 1
      @prime_factors[number] = return_array
    end

    # Returns the smallest prime factor of a given number
    sig { params(number: Integer, starting_point: Integer).returns(Integer) }
    def self.smallest_prime_factor(number, starting_point = 2)
      i = starting_point

      # Check if starting_point is a factor, and if not, continue with the next odd number.
      return i if TaylorMath.is_divisible_by(number, i)

      i += 1 if i.odd?
      i += 1

      # Loop all odd numbers starting from the smallest to see if any are prime factors (2 is the
      # only even prime)
      while i <= Math.sqrt(number)
        return i if TaylorMath.is_divisible_by(number, i)

        i += 2
      end

      number
    end

    sig { params(number: Integer).returns(T::Set[Integer]) }
    def self.all_factors(number)
      s1 = Set.new [1]
      prime_factors(number).each { |i| s1 += (s1.collect { |j| j * i }) }
      s1
    end

    sig { params(number: Integer).returns(T::Set[Integer]) }
    def self.proper_divisors(number)
      all_factors(number).delete(number)
    end
  end
end
