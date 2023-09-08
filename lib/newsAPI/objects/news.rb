require "ostruct"

module NewsAPI
  class News < Object
    def initialize(attrs)
      if attrs["source"]
        attrs["source"] = Source.new(attrs["source"])
      end
      super(attrs)
    end
  end
end
