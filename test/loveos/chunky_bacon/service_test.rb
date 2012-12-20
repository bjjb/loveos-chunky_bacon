require 'test_helper'
require 'rack/test'
require 'loveos/chunky_bacon/service'

class LoveOS::ChunkyBacon::ServiceTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoveOS::ChunkyBacon::Service
  end

  def test_index_returns_chunky_bacon
    get '/'
    assert_equal 'chunky bacon', last_response.body.strip.downcase
  end

  def test_4_gets_4_chunky_bacons
    get '/4'
    assert_equal 'chunky bacon' * 4, last_response.body.downcase.gsub("\n", '')
  end
end
