#private Map<String, Range> ranges;
class RangeResponse < Struct.new(:ranges) 
  include HashedInitializer
  class Range < Struct.new(:field, :min, :max)
    include HashedInitializer
  end
  def self.from_json(json)
    res = self.new(:ranges => [])
    json.each_pair do |key, value|
      res.ranges << Range.new( :field => key, :max => value["max"], :min => value["min"])
    end
    res
  end
end
