# rack_weather.rb

require 'hanami-router'
require 'json'

require './app/services/api_request'

# Blog Class
class RackWeather
  HEADERS = {
    'Content-Type' => 'application/json; charset=utf-8'
  }.freeze

  API = ApiRequest.new

  def self.router
    Hanami::Router.new do
      get '/', to: ->(env) { [200, {}, ['Welcome to Rack Weather']] }

      get '/weather-data/:city/:country', to: ->(env) do
        city = env['router.params'][:city]
        country = env['router.params'][:country]

        query = "/weather?q=#{city},#{country}&APPID=#{API.api_key}"

        resp = API.get(query)

        [200, {}, [JSON.pretty_generate(resp)]]
      end

      get '/weather/:city/:country', to: Weather::Show

      # get 'weather-data/:city/:country', to: Weather::Data
    end
  end

  # def call(env)
  #   req = Rack::Request.new(env)

  #   case req.path_info
  #   # when //
  #   #   [200, HEADERS, ['Hello World']]
  #   when /posts/
  #     [200, HEADERS, ['<h1>Posts</h1>']]
  #   when /about/
  #     [500, HEADERS, ['<h1>About</h1>']]
  #   else
  #     [404, HEADERS, ['No one here...']]
  #   end
  # end
end
