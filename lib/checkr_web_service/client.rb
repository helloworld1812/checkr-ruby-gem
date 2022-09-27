require 'checkr_web_service/connection'
require 'checkr_web_service/authentication'
require 'checkr_web_service/configuration'
require 'checkr_web_service/error'
require 'checkr_web_service/client/accounts'
require 'checkr_web_service/client/nodes'
require 'checkr_web_service/client/candidates'

module CheckrWebService
  class Client
    include CheckrWebService::Authentication
    include CheckrWebService::Configuration
    include CheckrWebService::Connection
    include CheckrWebService::Client::Accounts
    include CheckrWebService::Client::Nodes
    include CheckrWebService::Client::Candidates

    def initialize(options={})
      options = CheckrWebService.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
