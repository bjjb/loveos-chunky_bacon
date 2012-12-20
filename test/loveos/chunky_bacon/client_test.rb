require 'test_helper'
require 'fakeweb'
require 'loveos/chunky_bacon/client'

class LoveOS::ChunkyBacon::ClientTest < MiniTest::Unit::TestCase
  def setup
    @client = LoveOS::ChunkyBacon::Client.new(host: "example.com", port: 80)
  end

  def test_client_uri_is_as_given
    assert_equal "http://example.com", @client.uri
  end

  def test_client_gets_chunky_bacons
    FakeWeb.register_uri(:get, "http://example.com/3", :body => "fake bacon")
    assert_equal ['fake bacon'], @client.get(3)
  end
end
