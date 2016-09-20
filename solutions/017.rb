require './lib/taylor_math.rb'

########################
# Problem 17           #
# -------------------- #
# Number Letter Counts #
########################

def seventeen(n = 1000)
	i = 1
	sum = 0
	while i <= n
		sum += TaylorMath.wordify(i).to_s.tr('- ','').length
		i += 1
	end
	sum
end