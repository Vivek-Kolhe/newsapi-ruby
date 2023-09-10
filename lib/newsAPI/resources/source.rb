module NewsAPI
  class SourceReasource < Resource
    def list(params: {})
      Collection.from_response get_request("sources", params: params), key: "sources", type: Source
    end
  end
end
