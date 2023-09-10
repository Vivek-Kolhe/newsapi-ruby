require "minitest/autorun"
require "webmock/minitest"
require "newsAPI"
require "test_helper"

class NewsResourceTest < Minitest::Test
  PARAMS = {
    "q" => "bitcoin",
    "pageSize" => "1"
  }

  def setup
    WebMock.enable!
    setup_webmock(resource: "news", stubbed_url: "https://newsapi.org/v2/everything", fixture: "news/list", params: PARAMS)
  end

  def teardown
    WebMock.disable!
  end

  def test_list
    client = NewsAPI::Client.new(api_key: "test", adapter: :net_http)
    news = client.news.list(params: PARAMS)

    assert_equal NewsAPI::Collection, news.class
    assert_equal 12444, news.totalResults
    assert_equal Array, news.data.class
    assert_equal NewsAPI::News, news.data.first.class
    assert_equal NewsAPI::Source, news.data.first.source.class
  end
end
