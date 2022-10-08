require 'sawyer'
require 'checkr_web_service/authentication'
require 'base64'

module CheckrWebService
  # Network layer for API clients.
  module Connection
    include CheckrWebService::Authentication

    # Header keys that can be passed in options hash to {#get},{#head}
    CONVENIENCE_HEADERS = Set.new(%i[accept content_type])

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @return [Sawyer::Resource]
    def get(url, options={})
      request :get, url, nil, options
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def post(url, data=nil, options = {})
      request :post, url, data, options
    end

    # Make a HTTP PUT request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def put(url, data=nil, options = {})
      request :put, url, data, options
    end

    # Make a HTTP PATCH request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def patch(url, data=nil, options = {})
      request :patch, url, data, options
    end

    # Make a HTTP DELETE request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def delete(url, options = {})
      request :delete, url, nil, options
    end

    # Make a HTTP HEAD request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def head(url, options = {})
      request :head, url, nil, options
    end

    private

    def request(method, path, data, options = {})
      @last_response = response = agent.call(method, Addressable::URI.parse(path.to_s).normalize.to_s, data, options)
      response.data
    rescue CheckrWebService::Error => e
      @last_response = nil
      raise e
    end

    def paginate(url, options = {})
      page = 1
      opts = options.dup
      opts[:query] = {} if opts[:query].nil?
      opts[:query][:page] = page if opts[:query][:page].nil?
      opts[:query][:per_page] = @per_page if opts[:query][:per_page].nil?
      opts[:query][:order_by] = 'created_at' if opts[:query][:per_page].nil?
      opts[:query][:order] = 'asc' if opts[:query][:order].nil?

      data = request(:get, url, nil, opts).data

      if @auto_paginate
        while !@last_response&.data&.next_href.nil?
          page += 1
          opts[:query][:page] = page
          next_data = request(:get, url, nil, opts)&.data
          data.concat(next_data) if next_data.is_a?(Array)
        end
      end

      data
    end

    def last_response
      @last_response if defined? @last_response
    end

    def agent
      @agent ||= Sawyer::Agent.new(endpoint, sawyer_options) do |http|
        http.headers[:content_type] = 'application/json'
        http.headers[:user_agent] = user_agent
        http.headers[:Authorization] = "Basic #{Base64.encode64(access_token)}"
      end
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
