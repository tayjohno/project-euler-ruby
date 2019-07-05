# typed: true
# frozen_string_literal: true

require 'colorize'
require 'sorbet-runtime'
require_relative 'taylor_timer'
require_relative '../euler'

# EulerReport benchmarks all implemented Euler solutions, and prints out a human-readable report of
# the results.
class EulerReport
  LINE_LENGTH = 40

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
      "#{number_string}:".ljust(30, spacer) + "#{time_string(time).rjust(10, spacer)} ✓"
    case time
    when -4 # TODO: Should check if answer is correct.
      puts(("#{number_string}:".ljust(31, spacer) + 'Incorrect').red)
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
    puts((' ' * LINE_LENGTH).underline)
    puts(title.upcase.center(LINE_LENGTH, ' ').underline)
  end

  def format_line(title, value, color = :white, separator: ' ')
    prefix = title + ':'
    suffix_length = LINE_LENGTH - prefix.length
    suffix = value.rjust(suffix_length, separator)
    (prefix + suffix).colorize(color)
  end

  def time_string(seconds)
    format('%<seconds>.6f', seconds: seconds)
  end

  def average_time
    total_time / problems_implimented
  end

  def implemented_string
    "#{problems_implimented}/#{total_problems}"
  end

  def print_totals # rubocop:disable Metrics/AbcSize
    puts format_line('Total Time',   time_string(total_time))
    puts format_line('Average Time', time_string(average_time))

    puts format_line('Slowest Solution', slowest,               :red)
    puts format_line('Slowest Time',     time_string(max_time), :red)

    puts format_line('Fastest Solution', fastest,               :green)
    puts format_line('Fastest Time',     time_string(min_time), :green)

    puts format_line('Solutions Implimented', implemented_string, :cyan)
  end
end
