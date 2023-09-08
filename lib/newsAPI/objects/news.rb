require "ostruct"

module NewsAPI
  class News < OpenStruct
    def initialize(attrs)
      if attrs["source"]
        attrs["source"] = Source.new(attrs["source"])
      end
      super(attrs)
    end
  end
end
