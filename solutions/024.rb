require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################

# To convert an integer into characters, use the following
# 100.to_s.chars
# => ["1", "0", "0"]


# This handy little one-liner does the trick pretty quick, but it could be a lot smarter.
# def twentyfour(perm = 1_000_000, array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
#   array.map(&:to_s).permutation.to_a[perm - 1].join
# end


def twentyfour(perm=1_000_000,array=[0,1,2,3,4,5,6,7,8,9])
  array = array.map{|i| i.to_s}.sort
  nth_permutation(array, perm)
end

def nth_permutation(array, n)
  a = array.dup
  total_perms = TaylorMath.factorial(a.length)
  if n == 0
    a.join
  else
    # The index within the array of the character we selected.
    index = (n - 1) * a.length / total_perms
    return_val = a[index]
    a.delete_at(index)
    new_n = n % TaylorMath.factorial(a.length)
    return_val + nth_permutation(a, new_n)
  end
end
