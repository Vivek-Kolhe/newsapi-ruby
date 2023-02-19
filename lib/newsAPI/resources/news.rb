require 'ostruct'
require 'json'

module NewsAPI
  class NewsResource < Resource
    def list(params)
      raise Error, 'Params cannot be empty.' if params.empty?

      data = JSON.parse(get_request('everything', params).body.dig('articles').to_json, object_class: News)
      for item in data
        item['source'] = Source.new(item['source'])
      end
      data
    end
  end
end
