module CheckrWebService
  class Error < StandardError    
    attr_accessor :response

    # Returns the appropriate CheckrWebService::Error subclass based
    # on status and response message
    #
    # @param [Hash] response HTTP response
    # @return [CheckrWebService::Error]
    def self.from_response(response)
      status  = response[:status].to_i
      body    = response[:body].to_s
      headers = response[:response_headers]

      if klass = case status
      when 400
        CheckrWebService::BadRequest
      when 401
        CheckrWebService::ClientError
      when 403
        CheckrWebService::Forbidden
      when 404
        CheckrWebService::NotFound
      when 405
        CheckrWebService::MethodNotAllowed
      when 406
        CheckrWebService::NotAcceptable
      when 409
        CheckrWebService::Conflict
      when 415
        CheckrWebService::UnsupportedMediaType
      when 422
        CheckrWebService::UnprocessableEntity
      when 451
        CheckrWebService::UnavailableForLegalReasons
      when 400..499
        CheckrWebService::ClientError
      when 500
        CheckrWebService::InternalServerError
      when 501
        CheckrWebService::NotImplemented
      when 502
        CheckrWebService::BadGateway
      when 503
        CheckrWebService::ServiceUnavailable
      when 500..599
        CheckrWebService::ServerError
      end

      klass.new(response)
    end
  end

  private

  def initialize(response=nil)
    @response = response
    super(build_error_message)
  end

  def build_error_message
    return nil if response.nil?

    message = "Status: #{response&.status} \n"
    message << "Method: #{response&.method&.to_s.upcase} \n" 
    message << "URL: #{response&.url&.to_s} \n"
    message << "Body: \n"
    message << JSON.pretty_generate(response&.body)
    message

    # message = {
    #   status: response.status,
    #   headers: response.response_headers,
    #   body: response.body,
    #   request: {
    #     method: response.method,
    #     url_path: response.url.path,
    #     params: response.params,
    #     headers: response.request_headers,
    #     body: response.request_body
    #   }
    # }
    # JSON.pretty_generate(message)

  end

      # Status code returned by the GitHub server.
    #
    # @return [Integer]
    def response_status
      @response[:status]
    end

    # Headers returned by the GitHub server.
    #
    # @return [Hash]
    def response_headers
      @response[:response_headers]
    end

    # Body returned by the GitHub server.
    #
    # @return [String]
    def response_body
      @response[:body]
    end


end

  # Raised on errors in the 400-499 range
  class ClientError < Error; end

  # Raised when returns a 400 HTTP status code
  class BadRequest < ClientError; end

  # Raised when returns a 401 HTTP status code
  class Unauthorized < ClientError; end

  # Raised when returns a 403 HTTP status code
  class Forbidden < ClientError; end

  # Raised when returns a 404 HTTP status code
  class NotFound < ClientError; end

  # Raised when returns a 405 HTTP status code
  class MethodNotAllowed < ClientError; end

  # Raised when returns a 406 HTTP status code
  class NotAcceptable < ClientError; end

  # Raised when returns a 409 HTTP status code
  class Conflict < ClientError; end

  # Raised when returns a 414 HTTP status code
  class UnsupportedMediaType < ClientError; end

  # Raised when returns a 422 HTTP status code
  class UnprocessableEntity < ClientError; end

  # Raised when returns a 451 HTTP status code
  class UnavailableForLegalReasons < ClientError; end

  # Raised on errors in the 500-599 range
  class ServerError < Error; end

  # Raised when returns a 500 HTTP status code
  class InternalServerError < ServerError; end

  # Raised when returns a 501 HTTP status code
  class NotImplemented < ServerError; end

  # Raised when returns a 502 HTTP status code
  class BadGateway < ServerError; end

  # Raised when returns a 503 HTTP status code
  class ServiceUnavailable < ServerError; end

  # Raised when client fails to provide valid Content-Type
  class MissingContentType < ArgumentError; end

  # Raised when client fails to provide a required key
  class MissingKey < ArgumentError; end

  # Raised when a method requires an application client_id
  # and secret but none is provided
  class ApplicationCredentialsRequired < StandardError; end
end
