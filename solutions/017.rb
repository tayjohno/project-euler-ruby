require './TaylorMath.rb'

########################
# Problem 17           #
# -------------------- #
# Number Letter Counts #
########################

def seventeen(n = 1000)
	i = 1
	sum = 0
	while i <= n
		sum += TaylorMath.number_to_words(i).to_s.tr('- ','').length
		i += 1
	end
	sum
end