require "newsAPI/version"

module NewsAPI
  autoload :Client, 'newsAPI/client'
  autoload :Error, 'newsAPI/error'
  autoload :Resource, 'newsAPI/resource'

  autoload :NewsResource, 'newsAPI/resources/news'
  autoload :SourceReasource, 'newsAPI/resources/source'

  autoload :News, 'newsAPI/objects/news'
  autoload :Source, 'newsAPI/objects/source'
end
