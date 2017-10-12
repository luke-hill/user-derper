class User < ApplicationRecord
  has_many :holidays, primary_key: :id, foreign_key: :user_id
  has_many :searches, primary_key: :id, foreign_key: :user_id
  
  validates_presence_of :first_name, :surname, :email
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'is invalid' }

  def flag
    "#{domain}_flag"
  end
  
  def last_search_info
    {
      when: last_search.searched_at,
      where: location,
      pax: formatted_pax
    }
  end
  
  private
  
  def location
    Destination.find(last_search.destination_id).name
  end
  
  def formatted_pax
    "#{last_search.adults}/#{last_search.children}/#{last_search.infants}"
  end
  
  def last_search
    @last_search ||= searches.last
  end
end
