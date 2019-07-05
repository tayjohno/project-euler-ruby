# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################

# To convert an integer into characters, use the following
# 100.to_s.chars
# => ["1", "0", "0"]

# This is a one-line solution, but is much slower than my solution below
# def twentyfour(perm = 1_000_000, array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
#   array.map(&:to_s).permutation.to_a[perm - 1].join
# end
class TwentyFour
  def initialize(perm = 1_000_000, array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    @perm = perm
    @array = array
  end

  def solve
    @array = @array.map(&:to_s).sort
    nth_permutation(@array, @perm)
  end
end

def nth_permutation(array, n)
  a = array.dup
  total_perms = TaylorMath.factorial(a.length)
  return a.join.reverse if n.zero?

  # The index within the array of the character we selected.
  index = (n - 1) * a.length / total_perms
  return_val = a[index]
  a.delete_at(index)
  new_n = n % TaylorMath.factorial(a.length)
  return_val + nth_permutation(a, new_n)
end
