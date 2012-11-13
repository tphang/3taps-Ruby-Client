require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReferenceClient do
  before(:each) do
    @reference_client = ReferenceClient.new
  end

  it "should send GET request and create Categories array from result" do
    categories_response = mock "categories_array"
    Category.should_receive(:from_array).and_return categories_response

    @reference_client.get_categories.should == categories_response
  end

end
