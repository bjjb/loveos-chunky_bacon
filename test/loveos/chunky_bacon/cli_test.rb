require 'test_helper'
require 'loveos/chunky_bacon/cli'

require 'minitest/mock'

class LoveOS::ChunkyBacon::CLITest < MiniTest::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false
    @cli = LoveOS::ChunkyBacon::CLI.new
    @out, @err = String.new, String.new
    @cli.out = StringIO.new(@out, 'w')
    @cli.err = StringIO.new(@err, 'w')
  end

  def teardown
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = true
  end

  def test_cli_can_accept_an_array_of_args_unchanged
    cli = LoveOS::ChunkyBacon::CLI.new(%w(a b c))
    assert_equal %w(a b c), cli.args
  end

  def test_help_built_in_command_works
    @cli.args << 'help'
    @cli.start
    assert_equal @cli.to_s, @out
    assert_equal "", @err
  end

  def test_help_from_a_switch_prints_help
    @cli.args << '-h'
    @cli.start
    assert_equal @cli.to_s, @out
    assert_equal "", @err
  end

  def test_help_from_a_long_switch_prints_help
    @cli.args << '--help'
    @cli.start
    assert_equal @cli.to_s, @out
    assert_equal "", @err
  end

  def test_version_works
    @cli.args << 'version'
    @cli.start
    assert_equal "#{LoveOS::ChunkyBacon::VERSION}\n", @out
    assert_equal "", @err
  end

  def test_version_works_from_a_switch
    @cli.args << '-V'
    @cli.start
    assert_equal "#{LoveOS::ChunkyBacon::VERSION}\n", @out
    assert_equal "", @err
  end

  def test_version_works_from_a_long_option
    @cli.args << '--version'
    @cli.start
    assert_equal "#{LoveOS::ChunkyBacon::VERSION}\n", @out
    assert_equal "", @err
  end

  def test_help_with_no_arguments_prints_help
    @cli.args = []
    @cli.start
    assert_equal @cli.to_s, @out
  end

  def test_an_invalid_argument_complains
    @cli.args = ['unknown']
    @cli.start
    assert_equal "Unknown command: unknown\n", @err
  end

  def test_private_methods_are_not_commands
    @cli.args = ['initialize']
    @cli.start
    assert_equal "Unknown command: initialize\n", @err
  end

  def test_get_does_a_call
    FakeWeb.register_uri(:get, "http://foo.com/2", :body => "hello")
    @cli.args = %w(-H foo.com -P 80 get 2)
    @cli.start
    assert_equal "hello\n", @out
  end

  def test_setting_the_host_name
    @cli.args = %w(-H foo)
    @cli.start
    assert_equal 'foo', @cli.host
  end

  def test_setting_the_port
    @cli.args = %w(-P 9999)
    @cli.start
    assert_equal 9999, @cli.port
  end
end
