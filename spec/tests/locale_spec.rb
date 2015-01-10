# rspec spec/tests/locale_spec.rb

require 'spec_helper'

describe "Locale interpret" do
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
      it 'should return lv for ip: "81.198.65.13"' do
        expect( GeoLocale.locale(ip: "81.198.65.13") ).to eq "lv"
      end
      it 'should return en for ip: "97.77.25.20"' do
        expect( GeoLocale.locale(ip: "97.77.25.20") ).to eq "en"
      end
      it 'should return en-ie for ip: "54.170.245.171", lcid: true' do
        expect( GeoLocale.locale(ip: "54.170.245.171", lcid: true) ).to eq "en-gb"
      end
    end
    context "with customized config" do
    end
  end



end