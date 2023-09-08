module NewsAPI
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {'Authorization' => client.api_key})
      handle_response client.connection.get(url, params, headers)
    end

    def handle_response(response)
      case response.status
      when 400
          raise Error, 'Bad Request.'
      when 401
          raise Error, 'Unauthorized.'
      when 403
          raise Error, 'Forbidden.'
      when 404
          raise Error, 'Not Found.'
      when 429
          raise Error, 'Too many requests.'
      when 500
          raise Error, 'Internal Server Error.'
      when 503
          raise Error, 'The server is currently unavailable.'
      end
      response
    end
  end
end
