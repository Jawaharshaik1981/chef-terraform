#!/usr/bin/env ruby
# encoding: UTF-8

require File.expand_path("../test_helper", __FILE__)
require 'stringio'

class MarshalTest < TestCase
  def verify_profile(profile_1, profile_2)
    verify_threads(profile_1.threads, profile_2.threads)
  end

  def verify_threads(threads_1, threads_2)
    assert_equal(threads_1.count, threads_2.count)
    threads_1.count.times do |i|
      thread_1 = threads_1[i]
      thread_2 = threads_2[i]
      assert_nil(thread_2.id)
      assert_equal(thread_1.fiber_id, thread_2.fiber_id)

      verify_methods(thread_1.methods, thread_2.methods)
    end
  end

  def verify_methods(methods_1, methods_2)
    assert_equal(methods_1.count, methods_2.count)

    methods_1.count.times do |i|
      method_1 = methods_1[i]
      method_2 = methods_2[i]

      assert_equal(method_1.klass_name, method_2.klass_name)
      assert_equal(method_1.klass_flags, method_2.klass_flags)

      assert_equal(method_1.method_name, method_2.method_name)
      assert_equal(method_1.full_name, method_2.full_name)

      assert_equal(method_1.recursive?, method_2.recursive?)
      assert_equal(method_1.root?, method_2.root?)
      assert_equal(method_1.excluded?, method_2.excluded?)

      assert_equal(method_1.source_file, method_2.source_file)
      assert_equal(method_1.line, method_2.line)

      verify_measurement(method_1.measurement, method_2.measurement)

      verify_call_infos(method_1.callers, method_2.callers)
      verify_call_infos(method_1.callees, method_2.callees)

      verify_allocations(method_1.allocations, method_2.allocations)
    end
  end

  def verify_allocations(allocations_1, allocations_2)
    assert_equal(allocations_1.count, allocations_2.count)

    allocations_1.count.times do |i|
      allocation_1 = allocations_1[i]
      allocation_2 = allocations_2[i]

      assert_equal(allocation_1.klass_name, allocation_2.klass_name)
      assert_equal(allocation_1.klass_flags, allocation_2.klass_flags)

      assert_equal(allocation_1.count, allocation_2.count)
      assert_equal(allocation_1.memory, allocation_2.memory)

      assert_equal(allocation_1.source_file, allocation_2.source_file)
      assert_equal(allocation_1.line, allocation_2.line)
    end
  end

  def verify_call_infos(call_infos_1, call_infos_2)
    assert_equal(call_infos_1.count, call_infos_2.count)
    call_infos_1.count.times do |i|
      call_info_1 = call_infos_1[i]
      call_info_2 = call_infos_2[i]
      verify_call_info(call_info_1, call_info_2)
    end
  end

  def verify_call_info(call_info_1, call_info_2)
    assert_equal(call_info_1.parent, call_info_2.parent)
    assert_equal(call_info_1.target, call_info_2.target)

    assert_equal(call_info_1.depth, call_info_2.depth)
    assert_equal(call_info_1.source_file, call_info_2.source_file)
    assert_equal(call_info_1.line, call_info_2.line)

    verify_measurement(call_info_1.measurement, call_info_2.measurement)
  end

  def verify_measurement(measurement_1, measurement_2)
    assert_equal(measurement_1.total_time, measurement_2.total_time)
    assert_equal(measurement_1.self_time, measurement_2.self_time)
    assert_equal(measurement_1.wait_time, measurement_2.wait_time)
    assert_equal(measurement_1.called, measurement_2.called)
  end

  def test_marshal
    profile_1 = RubyProf.profile do
      1.times { RubyProf::C1.new.sleep_wait }
    end

    data = Marshal.dump(profile_1)
    profile_2 = Marshal.load(data)

    verify_profile(profile_1, profile_2)
  end

  def test_singleton
    profile_1 = RubyProf.profile do
      SingletonTest.instance.busy_wait
    end

    data = Marshal.dump(profile_1)
    profile_2 = Marshal.load(data)

    verify_profile(profile_1, profile_2)
  end
end
