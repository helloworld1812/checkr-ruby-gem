# frozen_string_literal: true
require File.expand_path('../spec_helper', __FILE__)

RSpec.describe CheckrWebService do
  after do
    CheckrWebService.reset
  end

  describe ".client" do
    it "should be a CheckrWebService::Client" do
      expect(CheckrWebService.client.is_a?(CheckrWebService::Client)).to be true
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      expect(CheckrWebService.endpoint).to eq(CheckrWebService::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      CheckrWebService.endpoint = 'https://apisandbox.paylocity.com'
      expect(CheckrWebService.endpoint).to eq('https://apisandbox.paylocity.com')
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      expect(CheckrWebService.user_agent).to eq(CheckrWebService::Configuration::DEFAULT_USER_AGENT)
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      CheckrWebService.user_agent = 'Custom User Agent - Bot'
      expect(CheckrWebService.user_agent).to eq('Custom User Agent - Bot')
    end
  end

  describe ".configure" do
    CheckrWebService::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        CheckrWebService.configure do |config|
          config.send("#{key}=", key)
          expect(CheckrWebService.send(key)).to eq(key)
        end
      end
    end
  end
end
