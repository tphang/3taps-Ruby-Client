# Class Posting represents structure of posting:
#
#  posting = Posting.new
#  posting.accountId            # => Integer
#  posting.annotations            # => Hash
#  posting.body               # => String
#  posting.category           # => String
#  posting.categoryClass      # => String
#  posting.categoryClassName  # => String
#  posting.categoryName       # => String
#  posting.currency           # => String
#  posting.expirationTimestamp # => Date
#  posting.flags               # => Integer
#  posting.hasImage            # => Boolean
#  posting.heading             # => String
#  posting.html                # => String
#  posting.id                  # => Integer
#  posting.images              # => Array
#  posting.immortal            # => Boolean
#  posting.indexed             # => Date
#  posting.language            # => String
#  posting.location            # => String
#  posting.postingTimestamp    # => Date
#  posting.price               # => Float
#  posting.source              # => String
#  posting.sourceId            # => String
#  posting.sourceUrl           # => String

#  posting.to_json                   # => Array of JSON objects
class Posting < SuperModel::Base
  attributes :accountId, :annotations, :body, :category, :categoryClass,
    :categoryClassName, :categoryName, :currency, :expirationTimestamp,
    :flags, :hasImage, :heading, :html, :id, :images, :immortal, :indexed,
    :language, :location, :postingTimestamp, :price, :source, :sourceId, :sourceUrl
  def initialize(*params)
    super(*params)
    @attributes[:images] ||= []
    @attributes[:annotations] ||= {}
  end

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash
  end
end
