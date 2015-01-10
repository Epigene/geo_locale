module GeoLocale

  def self.locale (country_code: "", ip: "", lcid: false)
    if country_code.present?
      puts "got code"
      unless lcid
        return GeoLocale::LOCALE[country_code]
      else
        return GeoLocale::LCID[country_code]
      end

    elsif ip.present?
      puts "got ip!"
      country_code = GeoLocale.country_code(ip)
      unless lcid
        return GeoLocale::LOCALE[country_code]
      else
        return GeoLocale::LCID[country_code]
      end

    else
      puts "got nutin"
      unless lcid
        return GeoLocale::LOCALE["#{GeoLocale.config.default_country}"]
      else
        return GeoLocale::LCID["#{GeoLocale.config.default_country}"]
      end
    end
  end

  LOCALE = {
    "lv" => "lv",
    "lt" => "lt",
    "ee" => "et",
    "ru" => "ru",
    "ie" => "en", # Ireland
    "gb" => "en", # UK a.k.a Great Britain
    "uk" => "en", # fallback England
    "us" => "en", # US&A
    "pl" => "pl",
    "de" => "de"
  }

  LCID = {
    "lv" => "lv",
    "lt" => "lt",
    "ee" => "et",
    "ru" => "ru",
    "ie" => "en-ie", # Ireland
    "gb" => "en-gb", # UK a.k.a Great Britain
    "uk" => "en-gb", # fallback England
    "us" => "en-us", # US&A
    "pl" => "pl",
    "de" => "de"
  }

end