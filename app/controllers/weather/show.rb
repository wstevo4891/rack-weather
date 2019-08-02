# app\controllers\weather\show.rb

require 'hanami/controller'
require './app/services/api_request'
require 'ostruct'

module Weather
  class Show
    include ::Hanami::Action

    API = ApiRequest.new

    def call(params)
      query = query_url(params)

      data = API.get(query)

      render_layout WeatherCell.new(OpenStruct.new(data))
    end

    private

    def query_url(params)
      "/weather?q=#{params[:city]},#{params[:country]}&APPID=#{API.api_key}"
    end

    def render_layout(content = '')
      self.body = LayoutCell.new(nil).show { content }
    end
  end
end
