# frozen_string_literal: true

require 'checkr_web_service/response/base_middleware'
require 'octokit/error'

module CheckrWebService
  # Faraday response middleware
  module Response
    # This class raises an Octokit-flavored exception based
    # HTTP status codes returned by the API
    class RaiseError < BaseMiddleware
      def on_complete(response)
        if error = CheckrWebService::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
