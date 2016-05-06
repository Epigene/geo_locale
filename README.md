# GeoLocale v0.9.5
Simple wrapper for GeoIP gem with some redundancy on GeoKit to get a two-letter country code or locale from an IP and, (optionally) request headers if a service like cloudflare is used.

## Basic use-case
Detect application user's origin and display app in that language.

## Requirements
Ruby 2.0.0 and greater.

## Installation

```ruby
# in Gemfile
gem 'geo_locale', '~> 0.9.5' # and bundle
```

## Usage
Configure default locales
```ruby
# in /config/initializers/geo_locale.rb
GeoLocale.configure do |config|
  config.localhost_country = "lv" # set the country to return for localhost, this country's locale and lcid will also be used for localhost
  config.default_country = "de" # set to nil or false if you want to catch fails in geolocation
  config.default_locale = "en" # country->locale conversion is minimal for now, set this explicitly to ensure GeoLocale.locale returns useful value
  config.default_lcid = "en-us"
  config.overrides["ee"] = "en" # hash used to override standard country codes
end
```

### To get country code:
```ruby
GeoLocale.country_code(ip: request.remote_ip, request_headers: request.headers)
# => "en"
```

### To get locale:
```ruby
GeoLocale.locale(country_code: "gb", request_headers: request.headers)
#=> "en"
GeoLocale.locale(country_code: "gb", lcid: true)
#=> "en-gb"
GeoLocale.locale(ip: "97.77.25.20")
#=> "en"
GeoLocale.locale(ip: "97.77.25.20", lcid: true)
#=> "en-us"
```

country_code is prioritized as it does not require external calls.
```ruby
GeoLocale.locale(ip: "97.77.25.20", country_code: "lv")
#=> "lv"
```

## TO-DO

1. Extend the country_code => locale hash in lib/geo_locale/locale.rb
2. Open the hash to configuration overrides
3. Automagically make initializer file for rails projects

## Contributing

1. Fork it ( https://github.com/Epigene/geo_locale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
