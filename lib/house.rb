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

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def price_per_square_foot
    (price_to_intiger / area.to_f).round(2)
  end

  def sort_bedrooms
    @bedrooms = @rooms.select do |room|
      room.category == :bedroom
    end
  end

  def sort_living_rooms
    @living_rooms = @rooms.select do |room|
      room.category == :living_room
    end
  end

  def sort_basements
    @basements = @rooms.select do |room|
      room.category == :basement
    end
  end

  def sort_rooms
    sort_bedrooms
    sort_living_rooms
    sort_basements
  end

  def rooms_by_category
    sort_rooms
    category = {bedroom: @bedrooms,
                living_room: @living_rooms,
                basement: @basements}

    category
  end

end
