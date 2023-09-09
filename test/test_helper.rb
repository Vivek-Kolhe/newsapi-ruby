$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "newsAPI"
require "minitest/autorun"
require "faraday"
require "json"

class Minitest::Test
  def setup_webmock(resource:, stubbed_url:, fixture:, params: {})
    stub_request(:get, stubbed_url)
      .with(query: hash_including(params))
      .to_return(
        status: 200,
        body: File.read("test/fixtures/#{fixture}.json"),
        headers: {
          "Content-Type" => "application/json"
        }
      )
  end
end