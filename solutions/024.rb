require './lib/taylor_math.rb'

##############################
# Problem 24                 #
# -------------------------- #
# Lexicographic permutations #
##############################


def twentyfour(perm=10000000,array=[0,1,2,3,4,5,6,7,8,9])
  array = array.map{|i| i.to_s}.sort
  i = 1
  countcomponents(perm, array) 
end

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


