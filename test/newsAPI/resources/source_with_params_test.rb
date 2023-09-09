require "minitest/autorun"
require "webmock/minitest"
require "newsAPI"
require "test_helper"

class SourceWithParamsResourceTest < Minitest::Test
  PARAMS = {
    "country" => "us",
    "category" => "business"
  }

  def setup
    WebMock.enable!
    setup_webmock(resource: "sources", stubbed_url: "https://newsapi.org/v2/sources", fixture: "source/list", params: PARAMS)
  end

  def teardown
    WebMock.disable!
  end

  def test_list
    client = NewsAPI::Client.new(api_key: "test", adapter: :net_http)
    news = client.sources.list(params: PARAMS)

    assert_equal NewsAPI::Collection, news.class
    assert_equal 4, news.totalResults
    assert_equal Array, news.data.class
    assert_equal NewsAPI::Source, news.data.first.class
  end
end
