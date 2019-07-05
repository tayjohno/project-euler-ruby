# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'
require 'date'

########################
# Problem 19           #
# -------------------- #
# Number Letter Counts #
########################
class Nineteen
  def initialize(start_date = Date.parse('1 Jan 1901'), end_date = Date.parse('31 Dec 2000'))
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
