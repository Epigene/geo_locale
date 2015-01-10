# rspec spec/tests/initialize_spec.rb

require 'spec_helper'

describe "Initializing" do
  it "should set default_country to us" do
    expect(GeoLocale.config.default_country).to eq "us"
  end
  it "should change default_country to de" do
    GeoLocale.config.default_country = "de"
    expect(GeoLocale.config.default_country).to eq "de"
  end
end