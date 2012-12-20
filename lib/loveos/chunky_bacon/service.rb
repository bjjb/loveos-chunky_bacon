require 'sinatra/base'
require 'loveos/chunky_bacon'

class LoveOS::ChunkyBacon::Service < Sinatra::Base

  # Answers LoveOS keepalive requests
  get '/ping' do
    content_type :text
    'OK'
  end

  # Gets a randomly shouted chunky bacon
  get '/' do
    content_type :text
    random_bacon
  end

  # Gets :times randomly shouted chunky bacons.
  get '/:times' do
    content_type :text
    random_bacon(params[:times]).join("\n")
  end

private
  def random_bacon(n = 1)
    bacon = []
    n.to_i.times do
      bacon << LoveOS::ChunkyBacon::Fox.random.bequeath
    end
    bacon
  end
end
