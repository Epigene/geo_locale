# GeoLocale

TODO: Write a gem description

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
GeoLocale.configure do |config|
  config.dev_country = "fr"
  config.local_country = "de"
end
```

## Contributing

1. Fork it ( https://github.com/Epigene/geo_locale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
