require 'checkr_web_service/response/raise_error'
require 'checkr_web_service/version'

module CheckrWebService
  module Configuration
    VALID_OPTIONS_KEYS = [
      :client_id,
      :client_secret,
      :access_token,
      :endpoint,
      :proxy,
      :ssl_verify_mode,
      :format,
      :per_page,
      :auto_paginate,
      :middleware,
      :connection_options,
      :user_agent
    ]

    # By default, don't set a user access token
    DEFAULT_ACCESS_TOKEN = nil

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set an application ID
    DEFAULT_CLIENT_ID = nil

    # By default, don't set an application secret
    DEFAULT_CLIENT_SECRET = nil

    # By default, don't set any connection options
    DEFAULT_CONNECTION_OPTIONS = {}

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    # Production Endpoint: https://api.checkr.com/v1/'
    # Staging Endpoint: https://api.checkr-staging.com/v1/
    DEFAULT_ENDPOINT = 'https://api.checkr.com/v1/'.freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note JSON is the only available format at this time
    DEFAULT_FORMAT = :json

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # By default, the ssl_verify_mode is set to 1
    # 0 is OpenSSL::SSL::VERIFY_NONE
    # 1 is OpenSSL::SSL::SSL_VERIFY_PEER
    # the standard default for SSL is SSL_VERIFY_PEER which requires a server certificate check on the client
    DEFAULT_SSL_VERIFY_MODE = 1

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "checkr-ruby-gem #{CheckrWebService::VERSION}".freeze

    DEFAULT_PER_PAGE = 25

    DEFAULT_AUTO_PAGINATE = false

    DEFAULT_MIDDLEWARE =  Faraday::RackBuilder.new do |builder|
      # In Faraday 2.x, Faraday::Request::Retry was moved to a separate gem
      # so we use it only when it's available.
      if defined?(Faraday::Request::Retry)
        builder.use Faraday::Request::Retry, exceptions: [CheckrWebService::ServerError]
      elsif defined?(Faraday::Retry::Middleware)
        builder.use Faraday::Retry::Middleware, exceptions: [CheckrWebService::ServerError]
      end

      builder.use CheckrWebService::Response::RaiseError
      builder.adapter Faraday.default_adapter
    end

    attr_accessor *VALID_OPTIONS_KEYS

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Creates a hash of options and their values.
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset configuration options to default values
    def reset
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.endpoint           = DEFAULT_ENDPOINT
      self.format             = DEFAULT_FORMAT
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self.ssl_verify_mode    = DEFAULT_SSL_VERIFY_MODE
      self.per_page           = DEFAULT_PER_PAGE
      self.auto_paginate      = DEFAULT_AUTO_PAGINATE
      self.middleware         = DEFAULT_MIDDLEWARE

      self
    end
  end
end
