# rspec spec/tests/geolocation_spec.rb

require 'spec_helper'

describe "Geolocation" do
  before :each do
    GeoLocale.config.overrides = {}
  end

  describe "GeoIP" do
    it "should return nil for 0.0.0.0" do
      expect(GeoLocale.geo_ip_try("0.0.0.0")).to eq nil
    end
    it "should return nil for localhost" do
      expect(GeoLocale.geo_ip_try("localhost")).to eq nil
    end
    it "should return lv for 81.198.65.13" do
      expect(GeoLocale.geo_ip_try("81.198.65.13")).to eq "lv"
    end
    it "should return lt for 77.79.35.98" do
      expect(GeoLocale.geo_ip_try("77.79.35.98")).to eq "lt"
    end
    it "should return ee for 188.92.162.172" do
      expect(GeoLocale.geo_ip_try("188.92.162.172")).to eq "ee"
    end
    it "should return et for 188.92.162.172 after override" do
      GeoLocale.config.overrides["ee"] = "et"
      expect(GeoLocale.geo_ip_try("188.92.162.172")).to eq "et"
    end
    it "should return ru for 92.255.197.224" do
      expect(GeoLocale.geo_ip_try("92.255.197.224")).to eq "ru"
    end
    it "should return us for 97.77.25.20" do
      expect(GeoLocale.geo_ip_try("97.77.25.20")).to eq "us"
    end
    it "should return gb for 78.157.209.36" do # Great Britain
      expect(GeoLocale.geo_ip_try("78.157.209.36")).to eq "gb"
    end
    it "should return ir for 77.104.75.76" do # Iran
      expect(GeoLocale.geo_ip_try("77.104.75.76")).to eq "ir"
    end
    it "should return ie for 54.170.245.171" do # Ireland
      expect(GeoLocale.geo_ip_try("54.170.245.171")).to eq "ie"
    end
    it "should return pl for 83.3.115.58" do # Poland
      expect(GeoLocale.geo_ip_try("83.3.115.58")).to eq "pl"
    end
  end

  describe "GeoKit" do
    it "should return nil for 0.0.0.0" do
      expect(GeoLocale.geokit_try("0.0.0.0")).to eq nil
    end
    it "should return nil for localhost" do
      expect(GeoLocale.geokit_try("localhost")).to eq nil
    end
    it "should return lv for 81.198.65.13" do
      expect(GeoLocale.geokit_try("81.198.65.13")).to eq "lv"
    end
    xit "should return lt for 77.79.35.98" do
      expect(GeoLocale.geokit_try("77.79.35.98")).to eq "lt"
    end
    xit "should return ee for 188.92.162.172" do
      expect(GeoLocale.geokit_try("188.92.162.172")).to eq "ee"
    end
    xit "should return et for 188.92.162.172 after override" do
      GeoLocale.config.overrides["ee"] = "et"
      expect(GeoLocale.geokit_try("188.92.162.172")).to eq "et"
    end
    it "should return ru for 92.255.197.224" do
      expect(GeoLocale.geokit_try("92.255.197.224")).to eq "ru"
    end
    it "should return us for 97.77.25.20" do
      expect(GeoLocale.geokit_try("97.77.25.20")).to eq "us"
    end
    xit "should return gb for 78.157.209.36" do # Great Britain
      expect(GeoLocale.geokit_try("78.157.209.36")).to eq "gb"
    end
    xit "should return ir for 77.104.75.76" do # Iran
      expect(GeoLocale.geokit_try("77.104.75.76")).to eq "ir"
    end
    it "should return ie for 54.170.245.171" do # Ireland
      expect(GeoLocale.geokit_try("54.170.245.171")).to eq "ie"
    end
    it "should return pl for 83.3.115.58" do # Poland
      expect(GeoLocale.geokit_try("83.3.115.58")).to eq "pl"
    end

  end
  # xit "status should be sent" do
  #   GeoLocale.configure do |c|
  #     c.dev_country = "fr"
  #     c.local_country = "de"
  #   end
  #   expect(GeoLocale.config.dev_country).to eq "fr"
  #   expect(GeoLocale.config.local_country).to eq "de"
  #   expect(GeoLocale.country_code("0.0.0.0")).to eq "xx"

  #   # # request = stub(host: 'dietbikini.com')
  #   # # GeoLocale.any_instance.stub request: request
  #   # helper.request.stub(:path).and_return("/asdf.asdf")
  #   # request = ActionController::TestRequest.new(host: "www.google.lv", remote_ip: "146.185.168.135")
  #   # expect(GeoLocale.geo_ip_try).to eq "xx"
  # end



end