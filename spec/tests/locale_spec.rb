# rspec spec/tests/locale_spec.rb

require 'spec_helper'

describe "Locale interpret" do
  before :each do
    GeoLocale.config = nil
    GeoLocale.configure {}
  end

  describe "from IP" do
    it "should return nil for 0.0.0.0" do
      expect(GeoLocale.locale("0.0.0.0")).to eq nil
    end
  end

end