# frozen_string_literal: true

require_relative "checkr_web_service/version"
require_relative 'checkr_web_service/error'
require_relative 'checkr_web_service/connection'
require_relative 'checkr_web_service/configuration'
require_relative 'checkr_web_service/authentication'
require_relative 'checkr_web_service/client'

module CheckrWebService
  extend CheckrWebService::Configuration

  class << self
    def client
      @client || CheckrWebService::Client.new(options)
    end
  end
end
