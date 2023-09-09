require 'minitest/autorun'
require 'webmock/minitest'
require 'newsAPI'

class NewsResourceTest < Minitest::Test
  PARAMS = {
    "q" => "bitcoin",
    "pageSize" => "1"
  }

  def setup
    WebMock.enable!
    # Stub the request to https://newsapi.org/v2/everything
    stub_request(:get, 'https://newsapi.org/v2/everything')
      .with(query: hash_including(PARAMS))
      .to_return(
        status: 200,
        body: File.read("test/fixtures/news/list.json"),
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  def teardown
    WebMock.disable!
  end

  def test_list
    client = NewsAPI::Client.new(api_key: "fake", adapter: :net_http)
    news = client.news.list(params: PARAMS)

    assert_equal NewsAPI::Collection, news.class
    assert_equal 12444, news.totalResults
    assert_equal Array, news.data.class
    assert_equal NewsAPI::News, news.data.first.class
    assert_equal NewsAPI::Source, news.data.first.source.class
  end
end
