# frozen_string_literal: true

holiday_types = %w[F+H FLO HTO]

user_one_id = User.find_by(email: 'THOMAS.Williams@hotmail.com').id # uk
user_two_id = User.find_by(email: 'WILLIAM.Corbyn@hotmail.com').id # uk
user_three_id = User.find_by(email: 'JOHN.Smith@hotmail.com').id # se
user_four_id = User.find_by(email: 'JOSEPH.Walker@hotmail.com').id # uk
user_five_id = User.find_by(email: 'FRANK.Robinson@hotmail.com').id # uk
user_six_id = User.find_by(email: 'HARRY.Hughes@hotmail.com').id # no
user_seven_id = User.find_by(email: 'DAVID.Scott@hotmail.com').id # no
user_eight_id = User.find_by(email: 'JACK.Morgan@hotmail.com').id # no
user_nine_id = User.find_by(email: 'GILBERT.Collins@hotmail.com').id # uk
user_ten_id = User.find_by(email: 'HUBERT.Carter@hotmail.com').id # se
user_eleven_id = User.find_by(email: 'MARTIN.Hunt@hotmail.com').id # uk
user_twelve_id = User.find_by(email: 'LIONEL.Holmes@hotmail.com').id # se
user_thirteen_id = User.find_by(email: 'DENNIS.Mills@hotmail.com').id # no
user_fourteen_id = User.find_by(email: 'EVAN.Owen@hotmail.com').id # uk
user_fifteen_id = User.find_by(email: 'HECTOR.Palmer@hotmail.com').id # se
user_sixteen_id = User.find_by(email: 'ALEC.Matthews@hotmail.com').id # no
# 7 * UK User / 4 * SE User / 5 * NO User -> 16 Users in Total

100.times do |value|
  holiday_type = holiday_types.sample

  if holiday_type == 'FLO'
    hotel_id = nil
    destination_id = Destination.all.sample.id
  else
    hotel = Hotel.all.sample
    hotel_id = hotel.id
    destination_id = hotel.destination.id
  end

  case value
  when 0..9
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_one_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 10..14
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_two_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 15..29
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_three_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 30..32
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_four_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 33..34
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_five_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 35..36
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_six_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 37..38
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_seven_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 39..40
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_eight_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 41..50
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_nine_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 51..51
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_ten_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 52..52
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_eleven_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 53..53
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_twelve_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 54..54
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_thirteen_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 55..65
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_fourteen_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  when 66..78
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_fifteen_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  else
    Search.create(
      destination_id: destination_id,
      adults: rand(1..4),
      children: rand(0..3),
      infants: rand(0..2),
      departure_date: DateTime.now + rand(20..150),
      nights: rand(4..14),
      searched_at: DateTime.now - rand(0..10),
      user_id: user_sixteen_id,
      hotel_id: hotel_id,
      holiday_type: holiday_type
    )
  end
end

users =
  [
    user_one_id, user_two_id, user_three_id, user_four_id, user_five_id,
    user_six_id, user_seven_id, user_eight_id, user_nine_id, user_ten_id,
    user_eleven_id, user_twelve_id, user_thirteen_id, user_fourteen_id,
    user_fifteen_id, user_sixteen_id
  ]

users.each do |user_id|
  rand(2..8).times do
    holiday_type = holiday_types.sample

    if holiday_type == 'FLO'
      hotel_id = nil
      destination_id = Destination.all.sample.id
    else
      hotel = Hotel.all.sample
      hotel_id = hotel.id
      destination_id = hotel.destination.id
    end

    rand(1..3).times do
      Search.create(
        destination_id: destination_id,
        adults: rand(1..4),
        children: rand(0..3),
        infants: rand(0..2),
        departure_date: DateTime.now + rand(20..150),
        nights: rand(4..14),
        searched_at: DateTime.now - rand(0..10),
        user_id: user_id,
        hotel_id: hotel_id,
        holiday_type: holiday_type
      )
    end
  end
end
