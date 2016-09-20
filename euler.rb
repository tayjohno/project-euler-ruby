require 'rubygems' 
require 'bundler/setup'
require 'logger'

require './lib/taylor_math.rb'
require './lib/taylor_timer.rb'

log = Logger.new(STDOUT)
if $VERBOSE
	log.level = Logger::DEBUG
else
	log.level = Logger::WARN
end
(1..476).each do |i|
  begin
    require "./solutions/#{i.to_s.rjust(3,'0')}.rb"
  rescue LoadError => e
  	log.info("./solutions/#{i.to_s.rjust(3,'0')}.rb not found")
  	log.debug(e)
  rescue Error => e
  	log.warn(e)
  end
end
