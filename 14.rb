class Item
  attr_reader :name
  def initialize(name, stuff=[])
    @id, @name, @stuff = 1, name, stuff
  end
end

class SpecialItem < Item
  def initialize name, special_attributes
    super name
    @special_attributes = special_attributes
  end
end
