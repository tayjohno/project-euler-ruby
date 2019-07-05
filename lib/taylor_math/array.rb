# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

module TaylorMath
  # INTEGER ARRAY FUNCTIONS
  module Array
    extend T::Sig

    sig { params(array: T::Enumerable[Integer]).returns(Integer) }
    def self.sum(array)
      array.inject(0, :+)
    end

    sig { params(array: T::Enumerable[Integer]).returns(Integer) }
    def self.product(array)
      array.inject(1, :*)
    end
  end
end
