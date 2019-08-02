# app\controllers\weather\show.rb

require 'hanami/controller'
require './app/services/api_request'

module Weather
  class Show
    include ::Hanami::Action

    API = ApiRequest.new

    def call(params)
      query = query_url(params)

      data = API.get(query)

      render_layout WeatherCell.new(data)
    end

    private

    def query_url(params)
      "/weather?q=#{params[:city]},#{params[:country]}&APPID=#{API.api_key}"
    end

    def render_layout(content = '')
      self.body = LayoutCell.new(nil).() { content }
    end
  end
end
