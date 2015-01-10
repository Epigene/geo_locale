# GeoLocale

Simple wrapper for GeoIP gem with some redundancy on GeoKit to get a two-letter country code or locale from an IP address.

Basic use-case: Detect application user's origin and display app in that language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geo_locale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_locale

## Usage
Configure default locales
```ruby
# in /config/initializers/geo_locale.rb
GeoLocale.configure do |config|
  config.default_country = "de" # set to nil or false if you want to catch fails in geolocation
  config.overrides["ee"] = "en" # hash used to override standard country codes
end
```

To get country code:
GeoLocale.country_code(ip: "")
Use in controller like so:
```ruby
GeoLocale.country_code(request.remote_ip)
=> "en"
```

To get locale:
GeoLocale.locale(country_code: "", ip: "", lcid: false)
```ruby
GeoLocale.locale(country_code: "gb")
=> "en"
GeoLocale.locale(country_code: "gb", lcid: true)
=> "en-gb"
GeoLocale.locale(ip: "97.77.25.20")
=> "en"
GeoLocale.locale(ip: "97.77.25.20", lcid: true)
=> "en-us"
```
country_code is prioritized as it does not require external calls.
```ruby
GeoLocale.locale(ip: "97.77.25.20", country_code: "lv")
=> "lv"
```

## Contributing

1. Fork it ( https://github.com/Epigene/geo_locale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
