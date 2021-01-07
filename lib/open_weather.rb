require "net/http"
require "open_weather/version"

module OpenWeather
  class Error < StandardError; end

  def get(api_key, city)
    return Net::HTTP.get(URI.parse("api.openweathermap.org/data/2.5/weather?q={#{city}}&appid={#{api_key}}"))
  end
end
