require './TaylorMath.rb'

##################
# Problem 15     #
# -------------- #
# Lattice Paths  #
##################

def fifteen(width = 20, height = 20)
	TaylorMath::MatrixPath.length(width, height)
end
