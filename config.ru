# config.ru

require_relative 'env'
require_relative 'rack_weather'

# Load Controllers
Dir['./app/controllers/**/*.rb'].sort.each { |file| require file }

run RackWeather.router
