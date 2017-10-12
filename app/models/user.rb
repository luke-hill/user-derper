class User < ApplicationRecord
  has_many :holidays, primary_key: :id, foreign_key: :user_id
  has_many :searches, primary_key: :id, foreign_key: :user_id
  
  validates_presence_of :first_name, :surname, :email
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'is invalid' }

  def flag
    "#{domain}_flag"
  end
  
  def last_search
    {
      when: DateTime.now,
      where: 'Tenerife',
    }
    #searches.last
  end
end
