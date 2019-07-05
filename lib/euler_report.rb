# typed: strict
# frozen_string_literal: true

require 'colorize'
require 'sorbet-runtime'
require_relative 'taylor_timer'
require_relative '../euler'

# EulerReport benchmarks all implemented Euler solutions, and prints out a human-readable report of
# the results.
class EulerReport
  extend T::Sig

  LINE_LENGTH = 40

  sig { void }
  def self.benchmark
    new.benchmark
  end

  sig { void }
  def initialize
    @total_time = T.let(0.0, Float)
    @problems_implimented = T.let(0, Integer)
    @total_problems = T.let(577, Integer)
    @max_time = T.let(nil, T.nilable(Float))
    @slowest = T.let(nil, T.nilable(String))
    @min_time = T.let(nil, T.nilable(Float))
    @fastest = T.let(nil, T.nilable(String))
  end

  sig { void }
  def benchmark
    print_title('SOLUTION TIMES')

    (1..total_problems).each { |i| perform_benchmark(i) }

    print_title('TOTALS')
    print_totals
  end

private

  sig { returns(Float) }
  attr_reader :total_time

  sig { returns(Integer) }
  attr_reader :problems_implimented

  sig { returns(Integer) }
  attr_reader :total_problems

  sig { returns(T.nilable(Float)) }
  attr_reader :max_time

  sig { returns(T.nilable(String)) }
  attr_reader :slowest

  sig { returns(T.nilable(Float)) }
  attr_reader :min_time

  sig { returns(T.nilable(String)) }
  attr_reader :fastest

  sig { params(problem_number: Integer).void }
  def perform_benchmark(problem_number)
    number_string =
      TaylorMath.wordify(problem_number).gsub(/\b(?<!['â`])[a-z]/, &:capitalize).tr('- ', '')

    # Capture any stdout from printing.
    original_stdout = $stdout
    $stdout = StringIO.new
    begin
      time = T.let(TaylorTimer.time_block { Object.const_get(number_string).new.solve }, T.any(Integer, Float))
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

  sig { params(title: String).void }
  def print_title(title)
    puts((' ' * LINE_LENGTH).underline)
    puts(title.upcase.center(LINE_LENGTH, ' ').underline)
  end

  sig { params(title: String, value: String, color: Symbol, separator: String).returns(String) }
  def format_line(title, value, color = :white, separator: ' ')
    prefix = title + ':'
    suffix_length = LINE_LENGTH - prefix.length
    suffix = value.rjust(suffix_length, separator)
    (prefix + suffix).colorize(color)
  end

  sig { params(seconds: T.any(Float, Integer)).returns(String) }
  def time_string(seconds)
    format('%<seconds>.6f', seconds: seconds)
  end

  sig { returns(Float) }
  def average_time
    total_time / problems_implimented
  end

  sig { returns(String) }
  def implemented_string
    "#{problems_implimented}/#{total_problems}"
  end

  sig { void }
  def print_totals # rubocop:disable Metrics/AbcSize
    puts format_line('Total Time',   time_string(total_time))
    puts format_line('Average Time', time_string(average_time))

    puts format_line('Slowest Solution', slowest.to_s,                 :red)
    puts format_line('Slowest Time',     time_string(max_time || 0.0), :red)

    puts format_line('Fastest Solution', fastest.to_s,                 :green)
    puts format_line('Fastest Time',     time_string(min_time || 0.0), :green)

    puts format_line('Solutions Implimented', implemented_string, :cyan)
  end
end
