require './TaylorMath.rb'

####################
# Problem 16       #
# ---------------- #
# Power Digit Sum  #
####################

def sixteen(n = 1000)
	TaylorMath.sum( (2**n).to_s.chars.map{ |c| c.to_i } )
end