require './lib/taylor_math.rb'

####################
# Problem 16       #
# ---------------- #
# Power Digit Sum  #
####################

def sixteen(n = 1000)
  TaylorMath::Array.sum((2**n).to_s.chars.map(&:to_i))
end
