require 'checkr_web_service/connection'
require 'checkr_web_service/authentication'
require 'checkr_web_service/configuration'
require 'checkr_web_service/error'
require 'checkr_web_service/client/companies'
require 'checkr_web_service/client/employees'
require 'checkr_web_service/client/credentials'
require 'checkr_web_service/client/onboardings'

module CheckrWebService
  class Client
    include CheckrWebService::Authentication
    include CheckrWebService::Configuration
    include CheckrWebService::Connection
    include CheckrWebService::Encryption
    include CheckrWebService::Client::Employees
    include CheckrWebService::Client::Companies
    include CheckrWebService::Client::Credentials
    include CheckrWebService::Client::Onboardings

    def initialize(options={})
      options = CheckrWebService.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
