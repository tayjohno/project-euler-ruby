module TaylorMath
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
          n = n / (TaylorMath::Array.product(@@prime_factors[n]) || 1)
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
  end
end