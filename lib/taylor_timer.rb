# typed: false
# frozen_string_literal: true

require 'timeout'

###################
# Timer Functions #
###################

# TaylorTimer is a simple stopwatch class for timing execution. The simplest way to use TaylorTimer
# is to call `::time_block` which accepts a block, and returns the time that block takes to execute.
#
#   TaylorTimer.time_block{ sleep 1 }
#   => 1.001538
class TaylorTimer
  attr_reader :start_time, :stop_time, :timing

  def start
    @start_time = Time.now
    @stop_time = nil
    @timing = true
  end

  def stop
    @stop_time = Time.now
    @timing = false
  end

  def time
    if @timing
      Time.now - @start_time
    else
      @stop_time - @start_time
    end
  end

  def time_block(timeout: 60, times: 1)
    timer.start
    times.times do
      Timeout.timeout(timeout) do
        yield
      end
    end
    timer.stop
    timer.time
  end

  def self.time_block(timeout: 60, times: 1)
    timer = new
    timer.start
    times.times do
      Timeout.timeout(timeout) do
        yield
      end
    end
    timer.stop
    timer.time
  end
end
