require "ostruct"
require "json"

module NewsAPI
  class HeadlinesResource < Resource
    def list(params:)
      Collection.from_response get_request("top-headlines", params: params), key: "articles", type: News
    end
  end
end
