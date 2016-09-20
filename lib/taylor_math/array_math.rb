module TaylorMath
  # INTEGER ARRAY FUNCTIONS
  module ArrayMath
    def self.sum(array)
      array.inject{ |sum, el| sum + el }
    end

    def self.product(array)
      array.inject{ |product, el| product * el }
    end
  end
end