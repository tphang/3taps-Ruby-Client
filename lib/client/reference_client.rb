# Class ReferenceClient represents server request of reference API (provides a
# mechanism for accessing the standard "reference information" used by the
# 3taps system.).
#
# Its methods are used to query API with appropriate requests:
#  client = ReferenceClient.new
#  client.get_categories     # => returns array of Category objects

class ReferenceClient < Client

  # Method +get_categories+ returns the 3taps categories.
  #
  # Example:
  #
  #  client = ReferenceClient.new
  #  client.get_categories # => Array of Category
  #
  def get_categories
    response = execute_get("/reference/categories")
    File.new("categories-example.json",  "w+") << response
    categories = []
    decode(response).each { |categoryClass| categories << Category.new(categoryClass) }
  end

end
