require 'spec_helper'

# rspec spec/tests/geolocation_spec.rb
describe "GeoLocale" do
  klass = GeoLocale

  lv_ip = LV_IPS.sample
  lt_ip = LT_IPS.sample
  ee_ip = EE_IPS.sample
  ru_ip = RU_IPS.sample
  us_ip = US_IPS.sample
  gb_ip = GB_IPS.sample
  ir_ip = IR_IPS.sample
  ie_ip = IE_IPS.sample
  pl_ip = PL_IPS.sample

  before :each do
    GeoLocale.config = nil
    GeoLocale.configure {}
  end

  describe ".country_code(ip: "", request_headers: {})" do
    before :all do
      @ip = "0.0.0.0"
    end

    context "when HTTP_CF_IPCOUNTRY is " do

      it "LV should return lv" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: LV_CLOUDFLARE_REQUEST_HEADERS)).to eq "lv"
      end

      it "LT should return lt" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: LT_CLOUDFLARE_REQUEST_HEADERS)).to eq "lt"
      end

      it "EE should return ee" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: EE_CLOUDFLARE_REQUEST_HEADERS)).to eq "ee"
      end

      it "RU should return ru" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: RU_CLOUDFLARE_REQUEST_HEADERS)).to eq "ru"
      end

      it "US should return us" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: US_CLOUDFLARE_REQUEST_HEADERS)).to eq "us"
      end

      it "GB should return gb" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: GB_CLOUDFLARE_REQUEST_HEADERS)).to eq "gb"
      end

      it "IR should return ir" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: IR_CLOUDFLARE_REQUEST_HEADERS)).to eq "ir"
      end

      it "IE should return ie" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: IE_CLOUDFLARE_REQUEST_HEADERS)).to eq "ie"
      end

      it "PL should return pl" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: PL_CLOUDFLARE_REQUEST_HEADERS)).to eq "pl"
      end

      it "XX should return fallback to default_country" do
        expect(GeoLocale.country_code(ip: @ip, request_headers: XX_CLOUDFLARE_REQUEST_HEADERS)).to eq "us"
      end

    end

  end

  describe ".country_code(ip: "")" do
    it "should return lv for #{lv_ip}" do
      expect(GeoLocale.country_code(ip: lv_ip)).to eq "lv"
    end
    it "should return lt for #{lt_ip}" do
      expect(GeoLocale.country_code(ip: lt_ip)).to eq "lt"
    end
    it "should return ee for #{ee_ip}" do
      expect(GeoLocale.country_code(ip: ee_ip)).to eq "ee"
    end
    it "should return et for #{ee_ip} after override" do
      GeoLocale.config.overrides["ee"] = "et"
      expect(GeoLocale.country_code(ip: "#{ee_ip}")).to eq "et"
    end
    it "should return ru for #{ru_ip}" do
      expect(GeoLocale.country_code(ip: "#{ru_ip}")).to eq "ru"
    end
    it "should return us for #{us_ip}" do
      expect(GeoLocale.country_code(ip: "#{us_ip}")).to eq "us"
    end
    it "should return gb for #{gb_ip}" do # Great Britain
      expect(GeoLocale.country_code(ip: "#{gb_ip}")).to eq "gb"
    end
    it "should return ir for #{ir_ip}" do # Iran
      expect(GeoLocale.country_code(ip: "#{ir_ip}")).to eq "ir"
    end
    it "should return ie for #{ie_ip}" do # Ireland
      expect(GeoLocale.country_code(ip: "#{ie_ip}")).to eq "ie"
    end
    it "should return pl for #{pl_ip}" do # Poland
      expect(GeoLocale.country_code(ip: "#{pl_ip}")).to eq "pl"
    end

    describe "falling back to defaults" do
      it "should return config default and set value for 0.0.0.0" do
        expect(GeoLocale.country_code(ip: "0.0.0.0")).to eq "us"
        GeoLocale.config.default_country = "de"
        expect(GeoLocale.country_code(ip: "0.0.0.0")).to eq "de"
      end

      it "should return config default and set value for localhost" do
        expect(GeoLocale.country_code(ip: "localhost")).to eq "us"
        GeoLocale.config.default_country = "fr"
        expect(GeoLocale.country_code(ip: "localhost")).to eq "fr"
      end

      it "should return default value for nil" do
        expect(GeoLocale.country_code(ip: nil)).to eq "us"
        GeoLocale.config.default_country = "de"
        expect(GeoLocale.country_code(ip: nil)).to eq "de"
      end

      it "should return default value for empty IP string" do
        expect(GeoLocale.country_code(ip: "")).to eq "us"
        GeoLocale.config.default_country = "de"
        expect(GeoLocale.country_code(ip: "")).to eq "de"
      end
    end
  end

  # privates
  describe ".geo_ip_try(ip)" do
    it "should return nil for 0.0.0.0" do
      expect(GeoLocale.geo_ip_try("0.0.0.0")).to eq nil
    end
    it "should return nil for localhost" do
      expect(GeoLocale.geo_ip_try("localhost")).to eq nil
    end
    it "should return lv for #{lv_ip}" do
      expect(GeoLocale.geo_ip_try(lv_ip) ).to eq "lv"
    end
    it "should return lt for #{lt_ip}" do
      expect(GeoLocale.geo_ip_try(lt_ip)).to eq "lt"
    end
    it "should return ee for #{ee_ip}" do
      expect(GeoLocale.geo_ip_try(ee_ip)).to eq "ee"
    end
    it "should return et for #{ee_ip} after override" do
      GeoLocale.config.overrides["ee"] = "et"
      expect(GeoLocale.geo_ip_try("#{ee_ip}")).to eq "et"
    end
    it "should return ru for #{ru_ip}" do
      expect(GeoLocale.geo_ip_try("#{ru_ip}")).to eq "ru"
    end
    it "should return us for #{us_ip}" do
      expect(GeoLocale.geo_ip_try("#{us_ip}")).to eq "us"
    end
    it "should return gb for #{gb_ip}" do # Great Britain
      expect(GeoLocale.geo_ip_try("#{gb_ip}")).to eq "gb"
    end
    it "should return ir for #{ir_ip}" do # Iran
      expect(GeoLocale.geo_ip_try("#{ir_ip}")).to eq "ir"
    end
    it "should return ie for #{ie_ip}" do # Ireland
      expect(GeoLocale.geo_ip_try("#{ie_ip}")).to eq "ie"
    end
    it "should return pl for #{pl_ip}" do # Poland
      expect(GeoLocale.geo_ip_try("#{pl_ip}")).to eq "pl"
    end
  end

  describe ".geokit_try(ip)" do
    it "should return nil if taking too long" do
      expect( klass.send(:geokit_try, "1.1.1.1") ).to eq nil
    end
    # xit "should return nil for #{lv_ip}" do
    #   expect(GeoLocale.geokit_try("#{lv_ip}")).to eq nil
    # end
    # xit "should return nil for localhost" do
    #   expect(GeoLocale.geokit_try("localhost")).to eq nil
    # end
    xit "should return lv for #{lv_ip}" do
      puts lv_ip
      expect(GeoLocale.geokit_try(lv_ip)).to eq "lv"
    end
    # xit "should return lt for #{lt_ip}" do
    #   expect(GeoLocale.geokit_try(lt_ip)).to eq "lt"
    # end
    # xit "should return ee for #{ee_ip}" do
    #   expect(GeoLocale.geokit_try(ee_ip)).to eq "ee"
    # end
    # xit "should return et for #{ee_ip} after override" do
    #   GeoLocale.config.overrides["ee"] = "et"
    #   expect(GeoLocale.geokit_try("#{ee_ip}")).to eq "et"
    # end
    # xit "should return ru for #{ru_ip}" do
    #   expect(GeoLocale.geokit_try("#{ru_ip}")).to eq "ru"
    # end
    # xit "should return us for #{us_ip}" do
    #   expect(GeoLocale.geokit_try("#{us_ip}")).to eq "us"
    # end
    # xit "should return gb for #{gb_ip}" do # Great Britain
    #   expect(GeoLocale.geokit_try("#{gb_ip}")).to eq "gb"
    # end
    # xit "should return ir for #{ir_ip}" do # Iran
    #   expect(GeoLocale.geokit_try("#{ir_ip}")).to eq "ir"
    # end
    # xit "should return ie for #{ie_ip}" do # Ireland
    #   expect(GeoLocale.geokit_try("#{ie_ip}")).to eq "ie"
    # end
    # xit "should return pl for #{pl_ip}" do # Poland
    #   expect(GeoLocale.geokit_try("#{pl_ip}")).to eq "pl"
    # end
  end

end
