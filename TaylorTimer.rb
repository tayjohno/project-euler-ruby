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
  
  def self.time_block(timeout=5)
    timer = self.new
    timer.start
    status = Timeout::timeout(timeout) {
      yield
    }
    timer.stop
    timer.get_time
  end

  def self.time_all
    puts "                                        ".underline
    puts "             SOLUTION TIMES             ".underline

    total_time = 0
    problems_implimented = 0
    total_problems = 476

    max_time = 0
    slowest = nil

    min_time = 999999
    fastest = nil
    
    (1..total_problems).each do |i|
      i_string = TaylorMath.number_to_words(i).tr('- ','')
      begin
        time = time_block { send( i_string ) } 
        total_time += time
        problems_implimented += 1
        if time < min_time
          min_time = time
          fastest = i_string
        elsif time > max_time
          max_time = time
          slowest = i_string
        end
      rescue Exception => e
        if e.message == "execution expired"
          time = -1
        else
          time = -2
        end
      end

      tabs = (i.even? ? "." : " ") * (30 - i_string.length) 
      print_string = "#{i_string}:#{tabs}#{sprintf'%f6',time} \u2713"
      case time
      when -2
        puts "#{i_string}:#{tabs}No Method".light_black
      when -1
        puts "#{i_string}:#{tabs}Timed Out".red
      when 0..0.1
        puts print_string.green
      when 0.1..1
        puts print_string.yellow
      when 0..90000
        puts print_string.red
      else
        puts "#{i_string}:#{tabs}#{tab*2}Incorrect".red
      end
    end
    puts "                                        ".underline
    puts "                 TOTALS                 ".underline
    puts "Total Time:                    #{sprintf'%f6',total_time}"
    puts "Average Time:..................#{sprintf'%f6',total_time/problems_implimented}"
    puts "Slowest Solution:#{' ' * (23 - slowest.length)}#{slowest}".red
    puts "Slowest Time:..................#{sprintf'%f6',max_time}".red  
    puts "Fastest Solution:#{' ' * (23 - fastest.length)}#{fastest}".green
    puts "Fastest Time:..................#{sprintf'%f6',min_time}".green
    puts "Solutions Implimented:           #{' ' * (3-problems_implimented.to_s.length)}#{problems_implimented}/#{total_problems}".cyan
    puts
  end
end
