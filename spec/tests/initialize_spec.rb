# rspec spec/tests/initialize_spec.rb

require 'spec_helper'

describe "Initializing" do
  before :all do

  end

  xit "status should be sent" do
    expect(@result[:status]).to eq "sent"
  end

end