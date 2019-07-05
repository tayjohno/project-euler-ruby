# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

module TaylorMath
  # This class is meant to help with common problems involving Triangle Sequences.
  class TriangleSequence
    extend T::Sig

    @sequence = T.let([0], T::Array[Integer])

    sig { params(n: Integer).returns(Integer) }
    def self.get_nth(n)
      return T.must(@sequence[n]) unless @sequence[n].nil?

      triangle_number(n, starting_number: @sequence.length)
    end

    sig { params(n: Integer, starting_number: Integer).returns(Integer) }
    def self.triangle_number(n, starting_number: 1)
      (starting_number..n).each do |x|
        @sequence[x] = (@sequence[x - 1] || 0) + x
      end
      T.must(@sequence[n])
    end
  end

  # This class is meant to help with common problems involving Fibonacci Sequences.
  class FibonacciSequence
    @sequence = [1, 1]
    def self.get_nth(n)
      # Return if memoized
      return @sequence[n - 1] if @sequence[n - 1]

      # Calculate all up to this one in order (avoids recursion)
      (@sequence.count..(n - 1)).each do |i|
        @sequence[i] = @sequence[i - 1] + @sequence[i - 2]
      end
      @sequence[n - 1]
    end
  end

  # This class is meant to help with common problems involving Coaltz Sequences.
  class CoaltzSequence
    extend T::Sig

    @sequence_length = T.let({ 1 => 1 }, T::Hash[Integer, Integer])

    sig { params(val: Integer).returns(Integer) }
    def self.next(val)
      return val / 2 if val.even?

      3 * val + 1
    end

    sig { params(val: Integer).returns(Integer) }
    def self.length(val)
      @sequence_length[val] ||= 1 + length(self.next(val))
    end
  end

  # This class is meant to help with common problems involving Matrix Paths.
  class MatrixPath
    @values_hash = {}
    def self.length(width, height)
      return 1 if width.zero? || height.zero?

      unless @values_hash["#{width}x#{height}"]
        value = length(width - 1, height)
        value += length(width, height - 1)
        @values_hash["#{width}x#{height}"] = value
      end

      @values_hash["#{width}x#{height}"]
    end
  end
end
