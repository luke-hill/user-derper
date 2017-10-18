# frozen_string_literal: true

myb_refs = Array.new(100) { |value| "MYB#{value}B" }

user_one_id = User.find_by(email: 'test@test.com').id # uk
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

100.times do |value|
  case value
  when 0..9
    Holiday.create(
      myb: myb_refs[value],
      user_id: user_one_id,
      search_id: Search.all[value].id
    )
  when 10..14
    Holiday.create(
      myb: myb_refs[value],
      user_id: user_two_id,
      search_id: Search.all[value].id
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
