# frozen_string_literal: true

FactoryGirl.define do
  factory :holiday do
    sequence(:myb) { |n| "MYB#{n}B" }
    user
    search
  end
end
