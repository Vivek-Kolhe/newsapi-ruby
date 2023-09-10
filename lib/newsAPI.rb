require "newsAPI/version"

module NewsAPI
  autoload :Client, "newsAPI/client"
  autoload :Collection, "newsAPI/collection"
  autoload :Error, "newsAPI/error"
  autoload :Resource, "newsAPI/resource"

  autoload :NewsResource, "newsAPI/resources/news"
  autoload :SourceReasource, "newsAPI/resources/source"
  autoload :HeadlinesResource, "newsAPI/resources/headlines"

  autoload :News, "newsAPI/objects/news"
  autoload :Source, "newsAPI/objects/source"
end
