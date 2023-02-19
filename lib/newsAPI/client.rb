require 'faraday'
require 'faraday_middleware'

module NewsAPI
  class Client
    BASE_URL = 'https://newsapi.org/v2/'
    attr_reader :api_key, :adapter
    
    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def news
      NewsResource.new(self)
    end

    def sources
      SourceReasource.new(self)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    def inspect
      '#<NewsAPI::Client>'
    end
  end
end
