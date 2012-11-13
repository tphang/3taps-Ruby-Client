require 'helper'

class TestReferenceClient < Test::Unit::TestCase
  should "test get categories" do
    client = ReferenceClient.new
    categories = client.get_categories
    assert_equal Array, categories.class
    assert_equal categories.length, 12
  end
end
