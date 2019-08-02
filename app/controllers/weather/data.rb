# app\controllers\weather\data.rb

require 'hanami/controller'
require './app/services/api_request'
require 'json'

module Weather
  class Data
    include ::Hanami::Action

    API = ApiRequest.new

    def call(params)
      query = query_url(params)

      data = API.get(query)

      self.body = JSON.pretty_generate(data)
    end

    private

    def query_url(params)
      "/weather?q=#{params[:city]},#{params[:country]}&APPID=#{API.api_key}"
    end
  end
end
