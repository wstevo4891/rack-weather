
# Rack Weather

A simple Rack web app for querying and rendering data from the OpenWeatherMap API.

## Getting Started

1. Sign up with OpenWeatherMap [here](https://home.openweathermap.org/users/sign_up)

2. Get an API key [here](https://home.openweathermap.org/api_keys)

3. Git clone rack-weather

4. Make an env.rb file at the root directory

5. Define your API key in env.rb like so:

   ```ruby```
   ENV['API_KEY] = 'your-api-key'
   ```ruby```

6. Install the gems

   bundle install

7. Start the server

   bundle exec rackup --port 3000 --host 0.0.0.0

## Using the App

There are currently two urls for querying weather data:

/weather/:city/:country

/weather-data/:city/:country

The first route displays HTML using Trailblazer's cells gem

The 'weather-data' route displays the JSON response

Examples:

localhost:3000/weather/London/uk

localhost:3000/weather-data/London/uk

## Acknowledgements

Many thanks to this great [Rack Tutorial](https://1devblog.org/article/framework-less-ruby-app-rack-based)

Also to this [Sitepoint article](https://www.sitepoint.com/introduction-to-cells-a-better-view-layer-for-rails/) on using Trailblazer cells
