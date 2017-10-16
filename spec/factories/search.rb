FactoryGirl.define do
  factory :search do
    destination
    adults 2
    children 0
    infants 0
    departure_date { DateTime.now + 30 }
    nights 7
    searched_at { DateTime.now }
    user
    hotel { Hotel.create(name: 'Cala Dor', destination: destination) unless holiday_type == 'FLO' }
    holiday_type 'F+H'
  end
end
