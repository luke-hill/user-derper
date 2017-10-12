class User < ApplicationRecord
  validates_presence_of :first_name, :surname, :email
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'only use valid domains' }

  def flag
    "#{domain}_flag"
  end
end
