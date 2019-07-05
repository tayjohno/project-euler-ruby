# typed: true
# frozen_string_literal: true

module TaylorMath
  # INTEGER ARRAY FUNCTIONS
  module Array
    def self.sum(array)
      array.inject(0, :+)
    end

    def self.product(array)
      array.inject(1, :*)
    end
  end
end
