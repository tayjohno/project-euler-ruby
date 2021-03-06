# frozen_string_literal: true

module TaylorMath
  # This class is meant to help with common problems involving Triangle Sequences.
  class TriangleSequence
    @sequence = [0]
    def self.get_nth(n)
      if !@sequence[n]
        triangle_number(n,
                        starting_number: @sequence.length - 1,
                        starting_value: @sequence[@sequence.length - 1])
      else
        @sequence[n]
      end
    end

    def self.triangle_number(n, options = {})
      x = options[:starting_number] || 0
      while x < n
        x += 1
        y = @sequence[x] = @sequence[x - 1] + x
      end
      y || options[:starting_value] || 0
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
    @sequence_length = { 1 => 1 }
    def self.next(val)
      return val / 2 if val.even?

      3 * val + 1
    end

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
