# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'logger'

require './lib/taylor_math.rb'
require './lib/taylor_timer.rb'

log = Logger.new(STDOUT)
log.level = if $VERBOSE
              Logger::DEBUG
            else
              Logger::WARN
            end
(1..577).each do |i|
  require "./solutions/#{i.to_s.rjust(3, '0')}.rb"
rescue LoadError => e
  log.info("./solutions/#{i.to_s.rjust(3, '0')}.rb not found")
  log.debug(e)
rescue Error => e
  log.warn(e)
end
