class User < ApplicationRecord
  has_many :holidays
  has_many :searches

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

  def user_name
    first_name.capitalize + ' ' + surname
  end

  def last_holiday
#    {
#    when: last_holiday.created_at,
#      where: location,
#      hotel:
#      pax: formatted_pax
#    }
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

  def last_holiday
    @last_holiday ||= holidays.last
end
