require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchClient do
  before(:each) do
    @search_client = SearchClient.new
  end

  it "should send GET request and create SearchResponse from result" do
    search_request = mock "search_request"
    search_request.should_receive(:query_params)
    search_response = mock "search_response"
    SearchResponse.should_receive(:new).and_return search_response

    @search_client.search(search_request).should == search_response
  end

  it "should send GET request and create SummaryResponse from result" do
    summary_request = mock "summary_request"
    summary_request.should_receive(:query_params)
    summary_response = mock "summary_response"
    SummaryResponse.should_receive(:from_hash).and_return summary_response

    @search_client.summary(summary_request).should == summary_response
  end

  it "should send GET request and create CountResponse from result" do
    search_request = mock "search_request"
    search_request.should_receive(:query_params)
    count_response = mock "count_response"
    CountResponse.should_receive(:new).and_return count_response

    @search_client.count(search_request).should == count_response
  end

end

