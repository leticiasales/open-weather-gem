require "net/http"
require "open_weather/version"
require "socket"

module OpenWeather
  class Error < StandardError; end

  class Request
    def initialize(api_key, lang = '')
      @api_key = api_key
      @lang = lang
    end

    def get(city_id)
      url = "https://api.openweathermap.org/data/2.5/weather?id=#{city_id}&appid=#{@api_key}"
      if @lang
        url += "&lang=#{@lang}"
      end

      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      headers = {
        'Accept' => '*/*',
        'User-Agent' => "OpenWeather Ruby Gem",
        "Content-Type" => "application/json",
        "Host" => Socket.gethostname,
        "Accept-Encoding" => "gzip, deflate, br",
        "Connection" => "keep-alive",
        "Access-Control-Allow-Origin" => "*"
      }
      data = http.get(uri.request_uri, headers)

      JSON.parse(data.body)
    end
  end
end
