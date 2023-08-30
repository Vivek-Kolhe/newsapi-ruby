require "ostruct"
require "json"

module NewsAPI
  class HeadlinesResource < Resource
    def list(params:)
      JSON.parse(get_request("top-headlines", params).body.dig("articles").to_json, object_class: News)
    end
  end
end
