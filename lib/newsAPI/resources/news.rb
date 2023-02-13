require 'ostruct'
require 'json'

module NewsAPI
  class NewsResource < Resource
    def list(params)
      raise Error, 'Params cannot be empty.' if params.empty?

      JSON.parse(get_request('everything', params).body.dig('articles').to_json, object_class: News)
    end
  end
end
