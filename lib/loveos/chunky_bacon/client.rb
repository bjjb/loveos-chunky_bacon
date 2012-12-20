require 'open-uri'
module LoveOS
  module ChunkyBacon
    # A silly client. A real client would do more interesting things (and also
    # handle errors, and whatnot).
    class Client
      attr_accessor :host, :port, :last_response

      def initialize(options = {})
        @host = options[:host] || "localhost" # would really come from LoveOS
        @port = options[:port] || "9292" # would really come from LoveOS
      end

      def get(number = 1)
        @last_response = open("#{uri}/#{number}").read
        @last_response.split("\n")
      end

      def uri
        URI("http://#{host}:#{port}").to_s
      end
    end
  end
end
