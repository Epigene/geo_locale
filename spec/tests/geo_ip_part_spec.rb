# rspec spec/tests/geo_ip_part_spec.rb

require 'spec_helper'

describe "GeoIP part" do
  before :all do

  end

  it "status should be sent" do
    # request = stub(host: 'dietbikini.com')
    # GeoLocale.any_instance.stub request: request
    helper.request.stub(:path).and_return("/asdf.asdf")
    request = ActionController::TestRequest.new(host: "www.google.lv", remote_ip: "146.185.168.135")
    expect(GeoLocale.geo_ip_try).to eq "xx"
  end



end