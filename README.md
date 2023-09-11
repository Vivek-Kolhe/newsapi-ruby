# NewsAPI

API wrapper for [NewsAPI](https://newsapi.org/) written in Ruby, providing classes to return a nicer object wrapping the response data.

## Installation

Adding `gem 'newsAPI'` to your Gemfile or running `gem install newsAPI` won't work because the gem isn't published yet. I've already attempted twice pushing to rubygems but encountered same error. \
Well, I might give it another shot later, but I can't make any guarantees. It's like déjà vu with those pesky errors! 😅 If you've stumbled upon this treasure trove of code, feel free to clone the repo and work your magic with the following commands in your terminal.
```console
$ gem build newsAPI.gemspec
$ gem install newsAPI-0.1.0.gem
```

[comment]: <> (Add this line to your application's Gemfile:)

[comment]: <> (```ruby)
[comment]: <> (gem 'newsAPI')
[comment]: <> (```)

[comment]: <> (And then execute:)

 [comment]: <> (   $ bundle install)

[comment]: <> (Or install it yourself as:)

 [comment]: <> (   $ gem install newsAPI)

## Usage

### Getting Started
To access the API, you'll need to create a `NewsAPI::Client` and pass in you API key. You can get your own at https://newsapi.org/account.
```ruby
client = NewsAPI::Client.new(api_key: YOUR_API_KEY)
```

### Resources
Wrapper includes different resource classes for news and sources. Having types like `NewsAPI::News` and `NewsAPI::Source` making it easy to understand what type of object you're working with. They're built using OpenStruct allowing you to access data using dot notation.

- [News](https://github.com/Vivek-Kolhe/newsapi-ruby#news)
- [Top Headlines](https://github.com/Vivek-Kolhe/newsapi-ruby#top-headlines)
- [Sources](https://github.com/Vivek-Kolhe/newsapi-ruby#sources)

#### News
```ruby
results = client.news.list(params: params)
```
**Note:** params is required. 
##### Example:
```ruby
params = { "q" => "bitcoin" }
results = client.news.list(params: params)
#=> NewsAPI::Collection

results.totalResults
#=> 11833

results.data
#=> [NewsAPI::News, NewsAPI::News]

results.data.first.source
#=> NewsAPI::Source
```
More about params [here](https://newsapi.org/docs/endpoints/everything).

#### Top Headlines
```ruby
results = client.headlines.list(params: params)
```
**Note:** params is required. 
##### Example:
```ruby
params = { "country" => "in" }
results = client.headlines.list(params: params)
#=> NewsAPI::Collection

results.totalResults
#=> 38

results.data
#=> [NewsAPI::News, NewsAPI::News]

results.data.first.source
#=> NewsAPI::Source
```
More about params [here](https://newsapi.org/docs/endpoints/top-headlines).

#### Sources
```ruby
results = client.sources.list(params: {})
```
**Note:** params is optional and can be ommitted.
##### Example:
```ruby
params = { "category" => "business" }
results = client.sources.list(params: params)
#=> News::Collection

results.totalResults
#=> 14

results.data
#=> [NewsAPI::Source, NewsAPI::Source]

results_without_params = client.sources.list
#=> NewsAPI::Collection

results_without_params.data
#=> [NewsAPI::Source, NewsAPI::Source]
```
More about params [here](https://newsapi.org/docs/endpoints/sources).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Vivek-Kolhe/newsapi-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Vivek-Kolhe/newsapi-ruby/blob/main/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NewsAPI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Vivek-Kolhe/newsapi-ruby/blob/main/CODE_OF_CONDUCT.mdd).
