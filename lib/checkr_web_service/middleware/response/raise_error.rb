require 'checkr_web_service/error'

module CheckrWebService
  module Middleware
    # Faraday response middleware
    module Response

      # This class raises an exception based
      # HTTP status codes returned by the API
      class RaiseError < Faraday::Response::Middleware

        def initialize(app)
          super app
        end

        def call(env)
          @app.call(env).on_complete do |response|
            if error = CheckrWebService::Error.from_response(response)
              raise error
            end
          end
        end
      end
    end
  end
end
