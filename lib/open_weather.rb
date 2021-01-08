require "net/http"
require "open_weather/version"

module OpenWeather
  class Error < StandardError; end

  class Request
    def initialize(api_key)
      @api_key = api_key
    end

    def get(city)
      return Net::HTTP.get(URI.parse("api.openweathermap.org/data/2.5/weather?q={#{city}}&appid={#{@api_key}}"))
    end
  end
end
