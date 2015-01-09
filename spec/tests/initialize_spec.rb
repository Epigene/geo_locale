# rspec spec/tests/initialize_spec.rb

require 'spec_helper'

describe "Initializing" do
  before :all do

  end

  it "should set dev_country to en" do
    expect(GeoLocale.config.dev_country).to eq "en"
  end
  it "should set local_country to en" do
    expect(GeoLocale.config.local_country).to eq "en"
  end
  it "should change local_country to de" do
    GeoLocale.config.local_country = "de"
    expect(GeoLocale.config.local_country).to eq "de"
  end
  it "should change dev_country to fr" do
    GeoLocale.configure do |c|
      c.dev_country = "fr"
    end
    expect(GeoLocale.config.dev_country).to eq "fr"
  end

end