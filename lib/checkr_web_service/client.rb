require 'checkr_web_service/connection'
require 'checkr_web_service/authentication'
require 'checkr_web_service/configuration'
require 'checkr_web_service/error'
require 'checkr_web_service/client/accounts'
require 'checkr_web_service/client/nodes'

module CheckrWebService
  class Client
    include CheckrWebService::Authentication
    include CheckrWebService::Configuration
    include CheckrWebService::Connection
    include CheckrWebService::Client::Accounts
    include CheckrWebService::Client::Nodes

    def initialize(options={})
      options = CheckrWebService.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
