require "minitest/autorun"
require "webmock/minitest"
require "newsAPI"
require "test_helper"

class HeadlinesResourceTest < Minitest::Test
  PARAMS = {
    "country" => "in",
    "pageSize" => "1"
  }

  def setup
    WebMock.enable!
    setup_webmock(resource: "headlines", stubbed_url: "https://newsapi.org/v2/top-headlines", fixture: "headlines/list", params: PARAMS)
  end

  def teardown
    WebMock.disable!
  end

  def test_list
    client = NewsAPI::Client.new(api_key: "test", adapter: :net_http)
    news = client.headlines.list(params: PARAMS)

    assert_equal NewsAPI::Collection, news.class
    assert_equal 38, news.totalResults
    assert_equal Array, news.data.class
    assert_equal NewsAPI::News, news.data.first.class
    assert_equal NewsAPI::Source, news.data.first.source.class
  end
end
