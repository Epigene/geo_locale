module GeoLocale

  def self.country_code
    country_code = GeoLocale.geo_ip_try
    if country_code.present?
      return
    else
      country_code = GeoLocale.config.local_country
    end
  end

  def self.geo_ip_try
    begin
      return GeoIP.new("#{GeoLocale::ROOT}/lib/data/GeoIP.dat").country(request.remote_ip).country_code2.downcase
    rescue
      nil
    end
  end

  def _try
    # request.location is handled by Geocoder, fails often
    # request.location.country_code.downcase
  end

end