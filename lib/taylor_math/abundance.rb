module TaylorMath
  class Abundance
    @@all_abundant_numbers = nil
    def self.all_abundant_numbers
      return @@all_abundant_numbers if @@all_abundant_numbers
      @@all_abundant_numbers = []
      i = 12
      while i < 28123
        if abundance(i) > 0
          @@all_abundant_numbers.push i
        end
        i += 1
      end
      return @@all_abundant_numbers
    end
    def self.abundance(i)
      d = TaylorMath::Array.sum(TaylorMath::Factors.proper_divisors(i)) - i
      return d
    end
  end
end