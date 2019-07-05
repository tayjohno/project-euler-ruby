# typed: true
# frozen_string_literal: true

require './lib/taylor_math.rb'

####################
# Problem 22       #
# ---------------- #
# Amicable Numbers #
####################
class TwentyTwo
  def initialize(file_name = './data/022_names.txt')
    @file = File.open(file_name)
  end

  def solve
    names = @file.read
    names = names.split(',').map { |name| name.tr('"', '') }.sort
    sum = 0
    names.each_with_index do |name, index|
      # puts "#{index}:\t#{name}=\t#{TaylorMath.sum(name.bytes.map{ |i| i - 64})} * #{index+1} = #{(index+1) * TaylorMath.sum(name.bytes.map{ |i| i - 64})} "
      sum += (index + 1) * TaylorMath::Array.sum(name.bytes.map { |i| i - 64 })
    end
    sum
  end
end
