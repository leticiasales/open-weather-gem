require "net/http"
require "open_weather/version"
require "socket"
require "json"

module OpenWeather
  class Error < StandardError; end

  class Request
    def initialize(api_key, lang = '')
      @api_key = api_key
      @lang = lang
    end

    def get(city_id)
      url = build_url("weather", city_id)

      response = request(url)
      result = {}

      result[:weather] = response["weather"].map { |w|
          { :main => w["main"], :description => w["description"] }
        }

      result[:temp] = response["main"]["temp"]
      result[:city] = response["name"]

      result
    end

    def get_forecast(city_id)
      url = build_url("forecast", city_id)

      response = request(url)

      response["list"].map { |f| 
        {
          :temp => f["main"]["temp"],
          :date => f["dt_txt"],
          :weather => f["weather"].map { |w|
            { :main => w["main"], :description => w["description"] }
          }
        }
      }
    end

    private
      def build_url(type, city_id)
        url = "https://api.openweathermap.org/data/2.5/#{type}?id=#{city_id}&appid=#{@api_key}"

        if !@lang.nil?
          url += "&lang=#{ @lang }"
        end

        url
      end

      def headers
        {
          'Accept' => '*/*',
          'User-Agent' => "OpenWeather Ruby Gem",
          "Content-Type" => "application/json",
          "Host" => Socket.gethostname,
          "Accept-Encoding" => "gzip, deflate, br",
          "Connection" => "keep-alive",
          "Access-Control-Allow-Origin" => "*"
        }
      end

      def http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        http
      end

      def request(url)
        uri = URI.parse(url)
        data = http(uri).get(uri.request_uri, headers)
        JSON.parse(data.body)
      end
  end
end
