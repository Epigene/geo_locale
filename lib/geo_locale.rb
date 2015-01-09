require "geo_locale/version"
require "geo_locale/geo_locale"

module GeoLocale
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield(config)
  end

  class Config
    attr_accessor :local_country, :dev_country

    def initialize
      @local_country = "en"
      @dev_country = "en"
    end
  end

  GeoLocale.configure {}
  ROOT = File.expand_path("../..", __FILE__)

end
