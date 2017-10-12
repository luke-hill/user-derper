myb_refs = Array.new(100) { |value| "MYB#{value}B" }

user_one_id = User.find_by_email('test@test.com').id #tofix
user_two_id = User.find_by_email('test@test.com').id #tofix
user_three_id = User.find_by_email('test@test.com').id #tofix
user_four_id = User.find_by_email('test@test.com').id #tofix
user_five_id = User.find_by_email('test@test.com').id #tofix
user_six_id = User.find_by_email('test@test.com').id #tofix
user_seven_id = User.find_by_email('test@test.com').id #tofix
user_eight_id = User.find_by_email('test@test.com').id #tofix
user_nine_id = User.find_by_email('test@test.com').id #tofix
user_ten_id = User.find_by_email('test@test.com').id #tofix
user_eleven_id = User.find_by_email('test@test.com').id #tofix
user_twelve_id = User.find_by_email('test@test.com').id #tofix
user_thirteen_id = User.find_by_email('test@test.com').id #tofix
user_fourteen_id = User.find_by_email('test@test.com').id #tofix
user_fifteen_id = User.find_by_email('test@test.com').id #tofix
user_sixteen_id = User.find_by_email('test@test.com').id #tofix

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
