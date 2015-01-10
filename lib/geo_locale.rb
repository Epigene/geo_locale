require "geo_locale/version"
require "geo_locale/country_code"
require "geo_locale/locale"
require 'geoip'
require 'geokit'
require 'geokit-rails'

module GeoLocale
  class << self
    attr_accessor :config


  end

  def self.configure
    self.config ||= Config.new
    yield(config)
  end

  class Config
    attr_accessor :local_country, :dev_country, :overrides

    def initialize
      @local_country = "en"
      @dev_country = "en"
      @overrides = {}
    end
  end

  GeoLocale.configure {}
  ROOT = File.expand_path("../..", __FILE__)

end
