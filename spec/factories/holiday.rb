FactoryGirl.define do
  factory :holiday do
    myb generate(:myb)
    user
    search
  end

  factory :user do
    sequence(:myb) { |n| "MYB#{n}B" }
  end
end
