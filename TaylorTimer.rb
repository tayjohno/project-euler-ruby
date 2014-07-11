require 'colorize'

###################
# Timer Functions #
###################

class TaylorTimer
  @start_time = nil
  @stop_time = nil
  @timing = false

  def start
    @start_time = Time.now
    @stop_time = nil
    @timing = true
  end


  def get_time
    if @timing
      Time.now - @start_time
    else
      @stop_time - @start_time
    end
  end
  
  def stop
    @stop_time = Time.now
    @timing = false
  end
  
  def self.time_block
    timer = self.new
    timer.start
    yield
    timer.stop
    timer.get_time
  end

  def self.time_all
    total_time = 0
    %w[one two three four five six seven eight nine ten eleven twelve].each do |i|
      time = time_block { send(i) }
      total_time += time
      case time
      when 0..0.1
        puts "#{i}:\t#{sprintf'%f6',time}".green
      when 0.1..1
        puts "#{i}:\t#{sprintf'%f6',time}".yellow
      else
        puts "#{i}:\t#{sprintf'%f6',time}".red
      end
    end
    return total_time
  end
end


#time {
#  10 ** 100
#}