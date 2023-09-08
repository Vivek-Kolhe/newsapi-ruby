require "ostruct"
require "json"

module NewsAPI
  class NewsResource < Resource
    def list(params:)
      Collection.from_response get_request("everything", params), key: "articles", type: News
    end
  end
end
