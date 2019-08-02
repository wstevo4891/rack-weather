# app\cells\weather_cell.rb

require 'cell'
require 'cell/erb'

class WeatherCell < Cell::ViewModel
  include ::Cell::Erb

  property :id
  property :name
  property :cod
  property :coord
  property :weather
  property :base
  property :main
  property :visibility
  property :wind
  property :clouds
  property :dt
  property :sys
  property :timezone

  def show
    render
  end
end
