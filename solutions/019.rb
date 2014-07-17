require './TaylorMath.rb'

########################
# Problem 19           #
# -------------------- #
# Number Letter Counts #
########################

def nineteen(start_date = Date.parse("1 Jan 1901"), end_date = Date.parse("31 Dec 2000"))
	d = start_date
	sum = 0
	while d <= end_date
		sum += 1 if d.sunday?
		d = d.next_month
	end
	return sum
end