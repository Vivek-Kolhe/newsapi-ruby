require "newsAPI/version"

module NewsAPI
  autoload :Client, 'newsAPI/client'
  autoload :Error, 'newsAPI/error'
  autoload :Resource, 'newsAPI/resource'

  autoload :NewsResource, 'newsAPI/resources/news'

  autoload :News, 'newsAPI/objects/news'
end
