# Class Location represents structure of location:
#
#  location = Location.new
#  location.longitude   # => Float
#  location.latitude    # => Float
#  location.accuracy    # => Integer
#  location.countryCode # => String
#  location.regionCode  # => String
#  location.stateCode   # => String
#  location.metroCode   # => String
#  location.countyCode  # => String
#  location.cityCode    # => String
#  location.localityCode # => String
#  location.zipCode     # => String
class Location < Struct.new(:longitude, :latitude, :accuracy, :countryCode, :regionCode, :stateCode, :metroCode, :countyCode, :cityCode, :localityCode, :zipCode)
  
  #allows initialization of a new struct with an attribute hash
  def initialize(attributes = {})
    attributes.each do |key, value|
      self[key] = value
    end
  end
  
end
