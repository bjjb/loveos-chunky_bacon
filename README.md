# Loveos::ChunkyBacon

A sample LoveOS service, which serves LoveOS ChunkyBacon, and client, which gets
LoveOS ChunkyBacon from the service.

## Installation

Add this line to your application's Gemfile:

    gem 'loveos-chunky_bacon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install loveos-chunky_bacon

## Usage

### Service

```
cd loveos-chunky_bacon
bundle
rackup
```

The service is now running on http://localhost:1243

Alternatively, use the binary's `server` command to start the server.

```
loveos-chunky_bacon server
```

Or, if you have LoveOS installed (and you should), use

```
loveos chunky_bacon server
```

This way ChunkyBacon knows all about the other LoveOS services and clients it
has at its disposal.

That's fine for development, but in production, you will probably want to start
it as part of a LoveOS Environment. See http://github.com/dawanda/loveos for
details there.

### Client

Run

```
loveos-chunky-bacon get 3
```

It will print out 3 ChunkyBacons.

Not awfully useful.

To use it from another LoveOS service, you should include the gem in that
service's Gemfile. Then, in the service, you can use

```ruby
LoveOS::ChunkyBacon::Client
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
