# app\cells\weather_cell.rb

class WeatherCell < Cell::ViewModel
  include ::Cell::Erb

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
  property :id
  property :name
  property :cod
end
