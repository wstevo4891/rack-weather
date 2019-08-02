# app\controllers\weather\show.rb

require 'hanami/controller'
require './app/services/api_request'
require 'json'

module Weather
  class Show
    include ::Hanami::Action

    API = ApiRequest.new

    def call(params)
      query = query_url(params)

      resp = API.get(query)

      self.body = [JSON.pretty_generate(resp)]
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
