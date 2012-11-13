# Class Category represents structure of category:
#
#  category = Category.new
#  category.code            # => String
#  category.name            # => String
#  category.isCategoryClass # => Boolean
#  category.children        # => Array
#
class Category < Struct.new(:code, :name, :isCategoryClass, :children)

  #allows initialization of a new struct with an attribute hash
  def initialize(attributes = {})
    if attributes[:categoryClass].nil?
      self.isCategoryClass = false
      self.code = attributes[:category]
      self.name = attributes[:categoryName]
    else
      self.isCategoryClass = true
      self.children = []
      self.code = attributes[:categoryClass]
      self.name = attributes[:categoryClassName]

      attributes[:categories].each { |child| self.children << Category.new(child) }
    end
  end

end
