require 'colorize'
require './euler'

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

  def self.time_block(timeout: 60, times: 1)
    timer = new
    timer.start
    times.times do
      status = Timeout.timeout(timeout) do
        yield
      end
    end
    timer.stop
    timer.get_time
  end

  def self.time_all
    puts '                                        '.underline
    puts '             SOLUTION TIMES             '.underline

    total_time = 0
    problems_implimented = 0
    total_problems = 577

    max_time = 0
    slowest = nil

    min_time = 999_999
    fastest = nil

    (1..total_problems).each do |i|
      i_string = TaylorMath.wordify(i).gsub(/\b(?<!['â`])[a-z]/) { |match| match.capitalize }.tr('- ', '')

      # Capture any stdout from printing.
      original_stdout = $stdout
      $stdout = StringIO.new
      begin
        time = time_block { Object.const_get(i_string).new.solve }
        total_time += time
        problems_implimented += 1
        if time < min_time
          min_time = time
          fastest = i_string
        elsif time > max_time
          max_time = time
          slowest = i_string
        end
      rescue Timeout::Error => _
        time = -1
      rescue NameError => _
        time = (Object.const_defined?(i_string) ? -3 : -2)
      ensure
        $stdout = original_stdout
      end

      spacer = (i.even? ? '.' : ' ')
      print_string = "#{i_string}:".ljust(30, spacer) + "#{sprintf('%f6', time).rjust(10, spacer)} \u2713"
      case time
      when -3
        puts ("#{i_string}:".ljust(35, spacer) + 'Error').red
      when -2
        puts ("#{i_string}:".ljust(31, spacer) + 'No Method').light_black
      when -1
        puts ("#{i_string}:".ljust(31, spacer) + 'Timed Out').red
      when 0..0.1
        puts print_string.green
      when 0.1..1
        puts print_string.yellow
      when 0..90_000
        puts print_string.red
      else
        puts "#{i_string}:"..ljust(31, spacer) + "#{tab * 2}Incorrect".red
      end
    end
    puts '                                        '.underline
    puts '                 TOTALS                 '.underline
    puts "Total Time:#{sprintf('%f6', total_time).rjust(29, ' ')}"
    puts "Average Time:#{sprintf('%f6', total_time / problems_implimented).rjust(27, '.')}"
    puts "Slowest Solution:#{slowest.rjust(23, '.')}".red
    puts "Slowest Time:#{sprintf('%f6', max_time).rjust(27, '.')}".red
    puts "Fastest Solution:#{fastest.rjust(23, '.')}".green
    puts "Fastest Time:#{sprintf('%f6', min_time).rjust(27, '.')}".green
    puts "Solutions Implimented:           #{' ' * (3 - problems_implimented.to_s.length)}#{problems_implimented}/#{total_problems}".cyan
    puts
  end
end
