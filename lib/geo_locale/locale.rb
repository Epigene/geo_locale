module GeoLocale

  def self.locale (ip: "", country_code: nil, lcid: false)
    country_code ||= GeoLocale.country_code(ip: ip)
    GeoLocale.get_locale_or_lcid(country_code: country_code, lcid: lcid)
  end

  # consult http://www.science.co.il/Language/Locale-codes.asp

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
    "fr" => "fr",
    "sk" => "sk",
    "ua" => "uk",
    "br" => "pt",
    "fi" => "fi",
    "dk" => "da",
    "az" => "az",
    "ge" => "ka",
    "ro" => "ro",
    "md" => "ro"
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
    "fr" => "fr",
    "sk" => "sk",
    "ua" => "uk",
    "br" => "pt-br",
    "fi" => "fi",
    "dk" => "da",
    "az" => "az-az",
    "ge" => "ka",
    "ro" => "ro",
    "md" => "ro-mo"
  }

  private

    def self.get_locale_or_lcid(country_code: nil, lcid: false)
      if lcid
        lcid_string = GeoLocale::LCID[country_code]
        return figure_out_returnable_lcid(lcid_string: lcid_string)
      else
        locale = GeoLocale::LOCALE[country_code]
        return figure_out_returnable_locale(locale: locale)
      end
    end


    def self.figure_out_returnable_locale(locale: "")
      if locale.present?
        return locale
      else
        return GeoLocale.config.default_locale
      end
    end

    def self.figure_out_returnable_lcid(lcid_string: "")
      if lcid_string.present?
        return lcid_string
      else
        return GeoLocale.config.default_lcid
      end
    end

end
