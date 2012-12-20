require 'test_helper'
require 'loveos/chunky_bacon' # What we're testing (so we can run tests alone)

class LoveOS::ChunkyBaconTest < MiniTest::Unit::TestCase
  include LoveOS::ChunkyBacon

  def test_that_there_is_a_version
    assert VERSION
  end

  def test_that_theres_a_service
    assert Service
  end

  def test_that_there_is_a_client
    assert Client
  end

  def test_we_can_use_the_command_line
    exe = File.expand_path('../../../bin/loveos-chunky_bacon', __FILE__)
    assert File.stat(exe).executable?
  end

  def test_foxiness_of_foxes
    assert_kind_of Fox, Fox::Tall.new
    assert_kind_of Fox, Fox::Small.new
  end
end

