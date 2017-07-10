require './lib/taylor_math.rb'

########################
# Problem 19           #
# -------------------- #
# Number Letter Counts #
########################
class Nineteen
  def initialize(start_date = Date.new(1901, 1, 1), end_date = Date.new(2000, 12, 31))
    @start_date = start_date
    @end_date = end_date
  end

  def solve
    d = @start_date
    sum = 0
    while d <= @end_date
      sum += 1 if d.sunday?
      d = d.next_month
    end
    sum
  end
end
