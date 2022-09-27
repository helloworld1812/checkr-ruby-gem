require 'sawyer'
require 'checkr_web_service/authentication'

module CheckrWebService
  # Network layer for API clients.
  module Connection
    include CheckrWebService::Authentication

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @return [Sawyer::Resource]
    def get(url, options)
      request :get, url
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def post(url, options = {})
      request :post, url, options
    end

    # Make a HTTP PUT request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def put(url, options = {})
      request :put, url, options
    end

    # Make a HTTP PATCH request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def patch(url, options = {})
      request :patch, url, options
    end

    # Make a HTTP DELETE request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def delete(url, options = {})
      request :delete, url, options
    end

    # Make a HTTP HEAD request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def head(url, options = {})
      request :head, url, options
    end


    private

    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query]   = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end
      end

      @last_response = response = agent.call(method, Addressable::URI.parse(path.to_s).normalize.to_s, data, options)
      response.data
    rescue CheckrWebService::Error => e
      @last_response = nil
      raise e
    end


    def agent
      @agent ||= Sawyer::Agent.new(endpoint, sawyer_options) do |http|
        http.headers[:accept] = default_media_type
        http.headers[:content_type] = 'application/json'
        http.headers[:user_agent] = user_agent
        http.request :authorization, 'Basic', @access_token
      end
    end

    def last_response
      @last_response if defined? @last_response
    end

    def sawyer_options
      opts = {
        links_parser: Sawyer::LinkParsers::Simple.new
      }
      conn_opts = @connection_options
      conn_opts[:builder] = @middleware.dup if @middleware
      conn_opts[:proxy] = @proxy if @proxy
      if conn_opts[:ssl].nil?
        conn_opts[:ssl] = { verify_mode: @ssl_verify_mode } if @ssl_verify_mode
      else
        verify = @connection_options[:ssl][:verify]
        conn_opts[:ssl] = {
          verify: verify,
          verify_mode: verify == false ? 0 : @ssl_verify_mode
        }
      end
      opts[:faraday] = Faraday.new(conn_opts)

      opts
    end
  end
end
