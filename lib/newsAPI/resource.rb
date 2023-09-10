module NewsAPI
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {"Authorization" => client.api_key})
      handle_response client.connection.get(url, params, headers)
    end

    def handle_response(response)
      case response.status
      when 400
          raise Error, "Bad Request. #{response.body.dig("message")}"
      when 401
          raise Error, "Unauthorized. #{response.body.dig("message")}"
      when 429
          raise Error, "Too many requests. #{response.body.dig("message")}"
      when 500
          raise Error, "Internal Server Error. #{response.body.dig("message")}"
      end
      response
    end
  end
end
