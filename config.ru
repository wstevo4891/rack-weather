# config.ru
require_relative 'rack_weather'

run RackWeather.router
