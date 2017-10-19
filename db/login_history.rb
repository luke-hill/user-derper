# frozen_string_literal: true

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

users =
  [
    user_one_id, user_two_id, user_three_id, user_four_id, user_five_id,
    user_six_id, user_seven_id, user_eight_id, user_nine_id, user_ten_id,
    user_eleven_id, user_twelve_id, user_thirteen_id, user_fourteen_id,
    user_fifteen_id, user_sixteen_id
  ]

users.each do |user|
  r = rand
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 15) if r < 0.3
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 13.3) if r < 0.1
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 12) if r < 0.8
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 11.1) if r < 0.9
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 8) if r < 0.8
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 7.5) if r < 0.5
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 6) if r < 0.2
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 5.2) if r < 0.1
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 4) if r < 0.9
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 3.8) if r < 0.8
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 2.1) if r < 0.5
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 1.4) if r < 0.8
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 0.5) if r < 0.4
  LoginHistory.create(user_id: user, logged_in: DateTime.now - 0.25) if r < 0.2
end
