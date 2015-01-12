# rspec spec/tests/locale_spec.rb

require 'spec_helper'

describe "Locale interpret" do
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

  describe "from country code" do
    context "with unchanged defaults" do
      it "should return en if no arguments given" do
        expect( GeoLocale.locale(country_code: "") ).to eq "en"
      end
      it 'should return lv for country_code: "lv"' do
        expect( GeoLocale.locale(country_code: "lv") ).to eq "lv"
      end
      it 'should return en for country_code: "gb"' do
        expect( GeoLocale.locale(country_code: "gb") ).to eq "en"
      end
      it 'should return en-gb for country_code: "gb", lcid: true' do
        expect( GeoLocale.locale(country_code: "gb", lcid: true) ).to eq "en-gb"
      end
    end
    context "with customized config" do
      it "should return de if no arguments given" do
        GeoLocale.config.default_country = "de"
        expect( GeoLocale.locale(country_code: "") ).to eq "de"
      end
      it 'should return lv for country_code: "lv"' do
        GeoLocale.config.default_country = "de"
        expect( GeoLocale.locale(country_code: "lv") ).to eq "lv"
      end
      it 'should return en for country_code: "gb"' do
        GeoLocale.config.default_country = "de"
        expect( GeoLocale.locale(country_code: "gb") ).to eq "en"
      end
      it 'should return en-gb for country_code: "gb", lcid: true' do
        GeoLocale.config.default_country = "de"
        expect( GeoLocale.locale(country_code: "gb", lcid: true) ).to eq "en-gb"
      end
    end
  end

  describe "from IP" do
    context "with unchanged defaults" do
      it "should return en if no arguments given" do
        expect( GeoLocale.locale(ip: "") ).to eq "en"
      end
      it "should return lv for #{lv_ip}" do
        expect( GeoLocale.locale(ip: lv_ip) ).to eq "lv"
      end
      it "should return en for #{us_ip} " do
        expect( GeoLocale.locale(ip: us_ip) ).to eq "en"
      end
      it "should return en-ie for #{ie_ip}, lcid: true" do
        expect( GeoLocale.locale(ip: ie_ip, lcid: true) ).to eq "en-ie"
      end
    end
    context "with customized config" do
      it "should return en if only default_contry configured and no arguments given" do
        GeoLocale.config.default_country = "no"
        expect( GeoLocale.locale(ip: "") ).to eq "en"
      end
      it "should return en if only default_locale configured and no arguments given" do
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: "") ).to eq "en"
      end
      it 'should return "no" if both defaults configured and no arguments given' do
        GeoLocale.config.default_country = "no"
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: "") ).to eq "no"
      end
      it "should return lv for #{lv_ip}" do
        GeoLocale.config.default_country = "no"
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: lv_ip) ).to eq "lv"
      end
      it "should return en for #{gb_ip}" do
        GeoLocale.config.default_country = "no"
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: gb_ip) ).to eq "en"
      end
      it "should return en-ie for #{ie_ip}, lcid: true" do
        GeoLocale.config.default_country = "no"
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: ie_ip, lcid: true) ).to eq "en-ie"
      end
      it "should return lt for #{lt_ip}, lcid: true" do
        GeoLocale.config.default_country = "no"
        GeoLocale.config.default_locale = "no"
        expect( GeoLocale.locale(ip: lt_ip, lcid: true) ).to eq "lt"
      end
    end
  end



end