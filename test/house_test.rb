require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_a_price
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$400000", house.price
  end

  def test_it_has_an_address
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_it_has_no_rooms_by_default
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_rooms_can_be_added
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    rooms = [room_1, room_2]
    assert_equal rooms, house.rooms
  end

  def test_can_change_price_to_integer
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price_to_intiger
  end

  def test_it_below_market_average_if_less_then_500000
    house = House.new("$400000", "123 sugar lane")

    assert_equal false, house.above_market_average?
  end

  def test_it_above_market_average_if_more_then_500000
    house = House.new("$600000", "123 sugar lane")

    assert_equal true, house.above_market_average?
  end

  def test_it_can_show_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    bedrooms = [room_1, room_2]
    basement = [room_4]

    assert_equal bedrooms, house.rooms_from_category(:bedroom)
    assert_equal basement, house.rooms_from_category(:basement)
  end

  def test_it_has_a_total_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_it_has_details_as_hash
    house = House.new("$400000", "123 sugar lane")
    details = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal details, house.details
  end

end
