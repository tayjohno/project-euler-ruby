require './TaylorMath.rb'

####################
# Problem 22       #
# ---------------- #
# Amicable Numbers #
####################

def twentytwo(file_name = './Data/022_names.txt')
  file = File.open(file_name)
  names = file.read
  names = names.split(',')
  names = names.map{ |name| name.tr('"','') }
  names = names.sort
  sum = 0
  names.each_with_index do |name, index|
  	#puts "#{index}:\t#{name}=\t#{TaylorMath.sum(name.bytes.map{ |i| i - 64})} * #{index+1} = #{(index+1) * TaylorMath.sum(name.bytes.map{ |i| i - 64})} "
    sum += (index+1) * TaylorMath.sum(name.bytes.map{ |i| i - 64})
  end
  return sum
end
