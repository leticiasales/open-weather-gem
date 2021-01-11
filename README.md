# OpenWeather

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/open_weather`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_weather', :github => 'leticiasales/open-weather-gem', :branch => 'main'
```

And then execute:

    $ bundle install


## Usage

```ruby
request = OpenWeather::Request.new(OpenWeatherApiKey)
request.get/get_forecast(CityCode)
```

## Contributing

Bug reports are welcome on GitHub at https://github.com/leticiasales/open-weather-gem.
