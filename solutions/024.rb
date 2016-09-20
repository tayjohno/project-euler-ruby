require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################


def twentyfour(perm=1_000_000,array=[0,1,2,3,4,5,6,7,8,9])
  array = array.map{|i| i.to_s}.sort
  nth_permutation(array, perm)
end

# Assumes unique!
# For non-unique permutations, my intuition says that for each match divide the permutations by the
# factorial of the number of identical (e.g. if there are three '1's, divide by 3!, or 6).
def permutations(array)
  TaylorMath.factorial(array.length)
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
