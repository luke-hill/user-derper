holiday_types = %w{F+H FLO HTO}

user_one_id = User.find_by_email('test@test.com').id #uk
user_two_id = User.find_by_email('WILLIAM.Corbyn@hotmail.com').id #uk
user_three_id = User.find_by_email('JOHN.Smith@hotmail.com').id #se
user_four_id = User.find_by_email('JOSEPH.Walker@hotmail.com').id #uk
user_five_id = User.find_by_email('FRANK.Robinson@hotmail.com').id #uk
user_six_id = User.find_by_email('HARRY.Hughes@hotmail.com').id #no
user_seven_id = User.find_by_email('DAVID.Scott@hotmail.com').id #no
user_eight_id = User.find_by_email('JACK.Morgan@hotmail.com').id #no
user_nine_id = User.find_by_email('GILBERT.Collins@hotmail.com').id #uk
user_ten_id = User.find_by_email('HUBERT.Carter@hotmail.com').id #se
user_eleven_id = User.find_by_email('MARTIN.Hunt@hotmail.com').id #uk
user_twelve_id = User.find_by_email('LIONEL.Holmes@hotmail.com').id #se
user_thirteen_id = User.find_by_email('DENNIS.Mills@hotmail.com').id #no
user_fourteen_id = User.find_by_email('EVAN.Owen@hotmail.com').id #uk
user_fifteen_id = User.find_by_email('HECTOR.Palmer@hotmail.com').id #se
user_sixteen_id = User.find_by_email('ALEC.Matthews@hotmail.com').id #no

100.times do
  holiday_type = holiday_types.sample
  
  hotel = 
    if type == 'FLO'
      nil
    else
      Hotel.all.sample
    end

  case value
    when 0..9
      Search.create(
        destination_id: hotel.destinations_id,
        adults: rand(1..4),
        children: rand(0..3),
        infants: rand(0..2),
        departure_date: DateTime.now + rand(20..150),
        nights: rand(4..14),
        searched_at: DateTime.now - rand(0..10),
        user_id: user_one_id,
        hotel_id: hotel.id,
        holiday_type: holiday_type
      )
    when 10..14
      Search.create(
        destination_id: hotel.destinations_id,
        adults: rand(1..4),
        children: rand(0..3),
        infants: rand(0..2),
        departure_date: DateTime.now + rand(20..150),
        nights: rand(4..14),
        searched_at: DateTime.now - rand(0..10),
        user_id: user_one_id,
        hotel_id: hotel.id,
        holiday_type: holiday_type
      )
    when 15..29
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_three_id,
          search_id: Search.all[value].id
      )
    when 30..32
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_four_id,
          search_id: Search.all[value].id
      )
    when 33..34
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_five_id,
          search_id: Search.all[value].id
      )
    when 35..36
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_six_id,
          search_id: Search.all[value].id
      )
    when 37..38
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_seven_id,
          search_id: Search.all[value].id
      )
    when 39..40
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_eight_id,
          search_id: Search.all[value].id
      )
    when 41..50
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_nine_id,
          search_id: Search.all[value].id
      )
    when 51..51
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_ten_id,
          search_id: Search.all[value].id
      )
    when 52..52
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_eleven_id,
          search_id: Search.all[value].id
      )
    when 53..53
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_twelve_id,
          search_id: Search.all[value].id
      )
    when 54..54
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_thirteen_id,
          search_id: Search.all[value].id
      )
    when 55..65
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_fourteen_id,
          search_id: Search.all[value].id
      )
    when 66..78
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_fifteen_id,
          search_id: Search.all[value].id
      )
    else
      Holiday.create(
          myb: myb_refs[value],
          user_id: user_sixteen_id,
          search_id: Search.all[value].id
      )
  end
end
