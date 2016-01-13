require 'timeout'

module GeoLocale
  IP_REGEX = /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/

  def self.country_code(ip: "") # ip = "12.12.12.12"
    return GeoLocale.config.localhost_country if ip == GeoLocale::LOCALHOST_IP && GeoLocale.config.localhost_country.present?
    country_code = GeoLocale.geo_ip_try(ip)
    if country_code.present?
      return country_code
    else
      country_code = GeoLocale.geokit_try(ip)
      if country_code.present?
        return country_code
      else
        # final fallback, config default
        return GeoLocale.config.default_country
      end
    end
  end

  private

    def self.geo_ip_try(ip)
      begin
        return nil unless ip.match(GeoLocale::IP_REGEX).present?
        code = GeoIP.new("#{GeoLocale::ROOT}/lib/data/GeoIP.dat").country(ip).country_code2.downcase
        if code == "--"
          return nil
        else
          if GeoLocale.config.overrides["#{code}"].present?
            return GeoLocale.config.overrides["#{code}"]
          else
            return code
          end
        end
      rescue
        nil
      end
    end

    def self.geokit_try(ip)
      return nil if ip.to_s[GeoLocale::IP_REGEX].blank?

      Timeout::timeout(3) do
        return Geokit::Geocoders::MultiGeocoder.geocode(ip.to_s).country_code.downcase
      end
    rescue
      return nil
    end

end
