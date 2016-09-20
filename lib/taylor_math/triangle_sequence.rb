module TaylorMath
  class TriangleSequence
    @@sequence = [0]
    def self.get_nth(n)
      unless @@sequence[n]
        self.triangle_number(n, starting_number:@@sequence.length-1, starting_value:@@sequence[@@sequence.length-1])
      else
        @@sequence[n]
      end
    end
    def self.triangle_number(n, options={})
      x = options[:starting_number] || 0
      y = options[:starting_value] || 0
      while x < n do
        x += 1
        y = @@sequence[x] = @@sequence[x-1] + x
      end
      return y
    end
  end

  class CoaltzSequence
    @@sequence_length = {1 => 1}
    def self.next(n)
      #puts "#{n}"
      return n/2 if n.even?
      return 3*n + 1
    end
    def self.length(n)
      #puts "#{n}:\t#{@@sequence_length[n]}"
      return @@sequence_length[n] if @@sequence_length[n]
      return @@sequence_length[n] = 1 + self.length(self.next(n))
    end
  end

  class MatrixPath
    @@values_hash={}
    def self.length(width, height)
      value = 0
      if width == 0 || height == 0
        return 1
      elsif @@values_hash["#{width}x#{height}"]
        return @@values_hash["#{width}x#{height}"]
      else
        value += self.length(width-1, height)
        value += self.length(width, height-1)
        @@values_hash["#{width}x#{height}"]=value
        return value
      end
    end
  end
end