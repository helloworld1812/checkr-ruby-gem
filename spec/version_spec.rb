require File.expand_path('../spec_helper', __FILE__)

RSpec.describe CheckrWebService::VERSION do
  it "has a version number" do
    expect(CheckrWebService::VERSION).not_to be nil
  end
end