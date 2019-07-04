# frozen_string_literal: true

require 'colorize'
require_relative 'taylor_timer'
require_relative '../euler'

# EulerReport benchmarks all implemented Euler solutions, and prints out a human-readable report of
# the results.
class EulerReport
  def self.benchmark
    new.benchmark
  end

  def initialize
    @total_time = 0
    @problems_implimented = 0
    @total_problems = 577
  end

  def benchmark
    print_title('SOLUTION TIMES')

    (1..total_problems).each { |i| perform_benchmark(i) }

    print_title('TOTALS')
    print_totals
  end

private

  attr_reader :total_time, :problems_implimented, :total_problems,
              :max_time, :slowest, :min_time, :fastest

  def perform_benchmark(problem_number)
    number_string =
      TaylorMath.wordify(problem_number).gsub(/\b(?<!['â`])[a-z]/, &:capitalize).tr('- ', '')

    # Capture any stdout from printing.
    original_stdout = $stdout
    $stdout = StringIO.new
    begin
      time = TaylorTimer.time_block { Object.const_get(number_string).new.solve }
      @total_time += time
      @problems_implimented += 1
      if min_time.nil? || time < min_time
        @min_time = time
        @fastest = number_string
      elsif max_time.nil? || time > max_time
        @max_time = time
        @slowest = number_string
      end
    rescue Timeout::Error => _e
      time = -1
    rescue NameError => _e
      time = (Object.const_defined?(number_string) ? -3 : -2)
    ensure
      $stdout = original_stdout
    end

    spacer = (problem_number.even? ? '.' : ' ')
    print_string =
      "#{number_string}:".ljust(30, spacer) + "#{format('%f6', time).rjust(10, spacer)} \u2713"
    case time
    when -4 # TODO: Should check if answer is correct.
      puts "#{number_string}:"..ljust(31, spacer) + "#{tab * 2}Incorrect".red
    when -3
      puts(("#{number_string}:".ljust(35, spacer) + 'Error').red)
    when -2
      puts(("#{number_string}:".ljust(31, spacer) + 'No Method').light_black)
    when -1
      puts(("#{number_string}:".ljust(31, spacer) + 'Timed Out').red)
    when 0..0.1
      puts print_string.green
    when 0.1..1
      puts print_string.yellow
    else
      puts print_string.red
    end
  end

  def print_title(title)
    puts((' ' * 40).underline)
    puts(title.upcase.center(40, ' ').underline)
  end

  def print_totals
    puts "Total Time:#{format('%f6', total_time).rjust(29, ' ')}"
    puts "Average Time:#{format('%f6', total_time / problems_implimented).rjust(27, '.')}"
    puts "Slowest Solution:#{slowest.rjust(23, '.')}".red
    puts "Slowest Time:#{format('%f6', max_time).rjust(27, '.')}".red
    puts "Fastest Solution:#{fastest.rjust(23, '.')}".green
    puts "Fastest Time:#{format('%f6', min_time).rjust(27, '.')}".green
    puts 'Solutions Implimented:'.cyan +
      "#{problems_implimented}/#{total_problems}".rjust(18, ' ').cyan
    puts
  end
end
