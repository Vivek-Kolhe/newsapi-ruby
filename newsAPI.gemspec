lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "newsAPI/version"

Gem::Specification.new do |spec|
  spec.name          = "newsAPI"
  spec.version       = NewsAPI::VERSION
  spec.authors       = ["Vivek Kolhe"]
  spec.email         = ["vivekkolhe694@gmail.com"]

  spec.summary       = "API wrapper for NewsAPI.org."
  spec.description   = "API wrapper for NewsAPI.org providing classes to return a nicer object wrapping the response data."
  spec.homepage      = "https://github.com/Vivek-Kolhe/newsapi-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.7.10"
  spec.add_dependency "webmock", "~> 3.18"
end