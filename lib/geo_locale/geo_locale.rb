module GeoLocale

  def self.hi
    puts "Hi there!"
  end

  def self.cc
    begin
      puts __FILE__
      # GeoIP.new("#{Rails.root}/lib/geoip/GeoIP.dat").country(request.remote_ip).country_code2.downcase
      # request.location is handled by Geocoder, fails often
      # request.location.country_code.downcase
    rescue
      nil
    end
  end

end