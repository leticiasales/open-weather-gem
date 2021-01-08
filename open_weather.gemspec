require_relative 'lib/open_weather/version'

Gem::Specification.new do |spec|
  spec.name          = "open_weather"
  spec.version       = OpenWeather::VERSION
  spec.authors       = ["Leticia Sales"]
  spec.email         = ["letisaless@gmail.com"]

  spec.summary       = "Make REST requests to OpenWeather"
  spec.homepage      = "https://github.com/leticiasales/open-weather-gem"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/leticiasales/open-weather-gem"

  spec.files = Dir['lib/**/*'] # Dir['lib/**/{*,.*}']
  spec.require_paths = ["lib"]
end
