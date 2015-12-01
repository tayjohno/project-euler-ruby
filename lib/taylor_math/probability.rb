module TaylorMath
  class Probability
    def self.ncr(n, r)
      factorial(n) / (factorial(r) * factorial(n - r))
    end

    def self.npr(n, r)
      factorial(n) / factorial(n - r)
    end

    def self.objects_factor(hash)
      factor = (hash['even'] + hash['odd']).reduce(1) do |memo, value|
        memo * factorial(value)
      end
    end

    def self.factorial(n)
      (1..n).reduce(&:*) || 1
    end
  end
end
