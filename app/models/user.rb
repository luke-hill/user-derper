class User < ApplicationRecord
  has_many :holidays
  has_many :searches
  has_many :login_histories

  validates_presence_of :first_name, :surname, :email
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'is invalid' }

  def flag
    "#{domain}_flag"
  end

  def last_search_info
    {
      when: last_search.searched_at,
      where: last_location.name,
      pax: formatted_pax
    }
  end

  def last_location
    Destination.find(last_search.destination_id) if last_search
  end

  def last_search
    @last_search ||= searches.last
  end

  def holidays?
    holidays.count > 0
  end

  private

  def formatted_pax
    "#{last_search.adults}/#{last_search.children}/#{last_search.infants}"
  end
end
