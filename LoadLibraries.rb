require 'rubygems' 
require 'bundler/setup'

require './TaylorMath.rb'
require './TaylorTimer.rb'
(1..476).each do |i|
  begin
    require "./solutions/#{i.to_s.rjust(3,'0')}.rb"
  rescue Exception => e
    #do nothing -- file not implimented yet.
  end
end
