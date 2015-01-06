require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################

# To convert an integer into characters, use the following
# 100.to_s.chars
# => ["1", "0", "0"]
def twentyfour(perm=1000000,array=[0,1,2,3,4,5,6,7,8,9])
  array.map{|i| i.to_s}.permutation.to_a[perm - 1].join
end

# Coming back to this after 1/2 year... not sure what this was supposed to be doing.
=begin
def countcomponents(perm, array)
  if array.length == 1
    perm -= 1
  else
    array.each do |n|
      partial_array = array.dup
      partial_array.delete(n)
      return_val = countcomponents(perm, partial_array)
      if return_val.is_a? Integer
        perm = return_val
      else
        return n + return_val
      end
    end
  end
  puts perm
  return perm
end
=end

