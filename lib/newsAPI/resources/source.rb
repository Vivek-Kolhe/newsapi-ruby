require "ostruct"
require "json"

module NewsAPI
  class SourceReasource < Resource
    def list(params: {})
      JSON.parse(get_request("top-headlines/sources", params).body.dig("sources").to_json, object_class: Source)
    end
  end
end
