require 'helper' 

class TestSearchClient < Test::Unit::TestCase

  should "get the search request result" do
    search_request = SearchRequest.new
    search_request.rpp = 2
    search_request.annotations = {:Make => "porsche"}
    client = SearchClient.new
    search_response = client.search(search_request)
    assert_equal SearchResponse, search_response.class
    assert_equal Array, search_response.results.class
    assert_equal Hash, search_response.results.first.class
  end

  should "get the count request result" do
    search_request = SearchRequest.new
    search_request.annotations = {:Make => "porsche"}
    client = SearchClient.new
    count_response = client.count(search_request)
    assert_equal CountResponse, count_response.class
    assert_not_equal nil , count_response.count

  end

  should "get the summary result" do
    search_request = SearchRequest.new
    search_request.annotations = {:Make => "porsche"}
    client = SearchClient.new
    summary_response = client.summary(search_request)
    assert_equal SummaryResponse, summary_response.class
  end

end
