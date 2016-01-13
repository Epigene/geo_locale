require 'spec_helper'

# rspec spec/tests/localhost_spec.rb
describe "GeoLocale" do
  before :each do
    GeoLocale.configure do |config|
      config.localhost_country = "lt"
    end
  end

  describe "Localhost" do
    describe "#country_code" do
      it "should return the configured country code" do
        expect(GeoLocale.country_code(ip: "127.0.0.1")).to eq "lt"
      end
      it "should return the gem default country_code if not configured" do
        GeoLocale.config = nil
        GeoLocale.configure {}
        expect(GeoLocale.config.default_country).to eq "us"
        expect(GeoLocale.country_code(ip: "127.0.0.1")).to eq "us"
      end
    end

    describe "#locale" do
      it "should return the configured locale" do
        expect(GeoLocale.locale(ip: "127.0.0.1")).to eq "lt"
      end
    end

    describe "#locale/lcid" do
      it "should return the configured lcid" do
        expect(GeoLocale.locale(ip: "127.0.0.1", lcid: true)).to eq "lt"
      end
    end
  end

end
