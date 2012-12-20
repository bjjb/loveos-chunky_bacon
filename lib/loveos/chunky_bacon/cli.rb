require 'optparse'
require 'forwardable'
require 'loveos/chunky_bacon/client'

module LoveOS
  module ChunkyBacon
    class CLI < OptionParser
      extend Forwardable

      attr_accessor :args, :commands, :host, :port, :out, :err
      delegate puts: :out, print: :out

      def initialize(args = [])
        super

        # What to process
        @args = args

        # Where to output
        @out, @err = $stdout, $stderr

        # Defaults
        @host, @port = 'localhost', 9292

        # Prepended to usage on `to_s`
        @banner = "Usage: #{program_name} [options] [command] [arguments]"

        # Options
        on('-h', '--help', 'Print this message', &method(:help))
        on('-V', '--version', 'Print the version', &method(:version))
        on('-H', '--host=HOSTNAME', 'Set the ChunkyBacon hostname') { |h| @host = h }
        on('-P', '--port=PORT', 'Set the ChunkyBacon service port', Integer) { |p| @port = p }

        # Commands
        @commands = %w(help version server commands get)
      end

      def start
        switches! # Process switches
        command!  # Run next command
      end

      def switches!(*args)
        args = @args if args.empty?
        return help if args.empty?
        order!(args) # parse next switches
      end

      # Handle a command (first argument)
      def command!(*args)
        return if @stop
        args = @args if args.empty?
        return help if args.empty?
        return send(args.shift, *args) if @commands.include?(args.first)
        err.puts "Unknown command: #{args.first}"
      end

      # The help command
      def help(*args)
        puts to_s
        @stop = true
      end

      # The version command
      def version(*args)
        puts LoveOS::ChunkyBacon::VERSION
        @stop = true
      end

      # The server command
      def server(*args)
        Dir.chdir(File.expand_path('../../../..', __FILE__))
        exec 'rackup'
        @stop = true
      end

      # The get command (passed on to a new client)
      def get(*args)
        client = Client.new(host: @host, port: @port)
        puts client.get(*args)
        @stop = true
      end

      # The command to list available commands
      def commands
        puts "Available commands:"
        puts @commands.join(' ')
        @stop = true
      end

      # Simpler usage of the class
      def self.start(args = ARGV)
        new(args).start
      end
    end
  end
end
