module GeoLocale

  def self.locale (ip: "", country_code: "", lcid: false)
    if country_code.present?
      unless lcid
        locale = GeoLocale::LOCALE[country_code]
        return figure_out_returnable_locale(locale: locale)
      else
        lcid_string = GeoLocale::LCID[country_code]
        return figure_out_returnable_lcid(lcid_string: lcid_string)
      end

    elsif ip.present?
      country_code = GeoLocale.country_code(ip: ip)
      unless lcid
        locale = GeoLocale::LOCALE[country_code]
        return figure_out_returnable_locale(locale: locale)
      else
        lcid_string = GeoLocale::LCID[country_code]
        return figure_out_returnable_lcid(lcid_string: lcid_string)
      end

    else
      unless lcid
        locale = GeoLocale::LOCALE["#{GeoLocale.config.default_country}"]
        return figure_out_returnable_locale(locale: locale)
      else
        lcid_string = GeoLocale::LCID["#{GeoLocale.config.default_country}"]
        return figure_out_returnable_lcid(lcid_string: lcid_string)
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
    "de" => "de",
    "fr" => "fr"
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
    "de" => "de",
    "fr" => "fr"
  }


  def self.figure_out_returnable_locale(locale:)
    if locale.present?
      return locale
    else
      return GeoLocale.config.default_locale
    end
  end

  def self.figure_out_returnable_lcid(lcid_string:)
    if lcid_string.present?
      return lcid_string
    else
      return GeoLocale.config.default_lcid
    end
  end

end