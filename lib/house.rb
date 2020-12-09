class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def price_to_intiger
    @price.delete('$').to_i
  end

  def above_market_average?
    price_to_intiger > 500000
  end

  def rooms_from_category(type)
    @rooms.select do |room|
      room.category == type
    end
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    {"price" => price_to_intiger,
     "address" => address}
  end
  
end
