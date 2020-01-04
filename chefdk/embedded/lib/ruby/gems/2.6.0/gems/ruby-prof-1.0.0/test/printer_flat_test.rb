#!/usr/bin/env ruby
# encoding: UTF-8

require File.expand_path('../test_helper', __FILE__)
require 'stringio'
require 'fileutils'
require 'tmpdir'
require_relative 'prime'

# --  Tests ----
class PrinterFlatTest < TestCase
  def setup
    # WALL_TIME so we can use sleep in our test and get same measurements on linux and windows
    RubyProf::measure_mode = RubyProf::WALL_TIME
    @result = RubyProf.profile do
      run_primes(1000, 5000)
    end
  end

  def flat_output_nth_column_values(output, n)
    only_method_calls = output.split("\n").select { |line| line =~ /^ +\d+/ }
    only_method_calls.collect { |line| line.split(/ +/)[n] }
  end

  def assert_sorted array
    array = array.map{|n| n.to_f} # allow for > 10s times to sort right, since lexographically 4.0 > 10.0
    assert_equal array, array.sort.reverse, "Array #{array.inspect} is not sorted"
  end

  def test_flat_string
    output = helper_test_flat_string(RubyProf::FlatPrinter)
    assert_match(/prime.rb/, output)
  end

  def helper_test_flat_string(klass)
    output = ''

    printer = klass.new(@result)
    printer.print(output)

    assert_match(/Thread ID: -?\d+/i, output)
    assert_match(/Fiber ID: -?\d+/i, output)
    assert_match(/Total: \d+\.\d+/i, output)
    assert_match(/Object#run_primes/i, output)
    output
  end

  def test_flat_result_sorting_by_self_time_is_default
    printer = RubyProf::FlatPrinter.new(@result)

    printer.print(output = '')
    self_times = flat_output_nth_column_values(output, 3)

    assert_sorted self_times
  end

  def test_flat_result_sorting
    printer = RubyProf::FlatPrinter.new(@result)

    sort_method_with_column_number = {:total_time => 2, :self_time => 3, :wait_time => 4, :children_time => 5}

    sort_method_with_column_number.each_pair do |sort_method, n|
      printer.print(output = '', :sort_method => sort_method)
      times = flat_output_nth_column_values(output, n)
      assert_sorted times
    end
  end
end
