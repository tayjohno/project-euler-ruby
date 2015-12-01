require './lib/taylor_math.rb'

###############################
# Problem 9                   #
# --------------------------- #
# Special Pythagorean Triplet #
###############################

def nine(n = 1000)
  # SET UP INITIAL VALUES
  a = 2
  b = (((n - a).to_f / 2).ceil - 1)

  # Loop through all A's less than 1/3 of n
  # We know the answer for a must be less than 1/3 because [a < b < c] AND [a + b + c = n]
  while a <= n / 3
    b = [(((n - a).to_f / 2).ceil - 1), b + 1].min
    while b > a
      c = ((n - a) - b)

      # DEBUG STATEMENTS TO INSPECT LOOP
      # print "a = #{a}\tb = #{b}\tc = #{c}"
      # puts "\tgreater" if (a**2 + b**2) > (c**2)
      # puts "\tless" if (a**2 + b**2) < (c**2)
      # puts "\tequal" if (a**2 + b**2) == (c**2)

      break if (a**2 + b**2) < (c**2)

      return a * b * c if c**2 == a**2 + b**2
      b -= 1
    end
    a += 1
  end
  nil
end
