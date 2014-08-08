module TaylorMath
  # INTEGER ARRAY FUNCTIONS
  module Array
    def self.sum(array)
      array.inject{ |sum, el| sum + el }
    end

    def self.product(array)
      array.inject{ |product, el| product * el }
    end
  end
end