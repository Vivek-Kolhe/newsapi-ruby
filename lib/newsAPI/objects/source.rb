require "ostruct"

module NewsAPI
  class Source < OpenStruct
    def initialize(attrs)
      super(attrs)
    end
  end
end
