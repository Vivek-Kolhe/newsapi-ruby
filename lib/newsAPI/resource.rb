module NewsAPI
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params, headers: {'Authorization' => client.api_key})
      handle_response client.connection.get(url, params, headers)
    end

    def handle_response(response)
      case response.status
      when 400
          pass
      when 401
          pass
      when 403
          pass
      when 404
          pass
      when 429
          pass
      when 500
          pass
      when 503
          pass
      end
      response
    end
  end
end
