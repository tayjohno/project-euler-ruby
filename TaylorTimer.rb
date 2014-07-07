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

end


#time {
#  10 ** 100
#}