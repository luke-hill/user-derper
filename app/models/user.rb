class User < ApplicationRecord
  has_many :holidays
  has_many :searches
  has_many :login_histories

  validates_presence_of :first_name, :surname, :email
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'is invalid' }

  def flag
    "#{domain}_flag"
  end

  def user_name
    "#{first_name.capitalize} #{surname}"
  end

  def last_search_info
    {
      when: last_search.searched_at,
      where: last_location.name,
      pax: search_formatted_pax
    }
  end

  def last_location
    Destination.find(last_search.destination_id) if last_search
  end

  def last_search
    @last_search ||= searches.last
  end

  def holidays?
    holidays.count.positive?
  end

  def last_holiday_info
    {
      order_id: last_holiday.myb,
      order_date: last_holiday.created_at,
      nights: booked.nights,
      departure_date: booked.departure_date,
      return_date: return_date,
      type: booked.holiday_type,
      where: booked_location,
      hotel: booked_hotel,
      pax: booked_formatted_pax
    }
  end

  private

  def return_date
    booked.departure_date + booked.nights
  end

  def booked
    booked_search = holidays.last.search_id
    @last_booked = Search.find(booked_search)
  end

  def booked_hotel
    Hotel.find(booked.hotel_id).name
  end

  def booked_location
    Destination.find(booked.destination_id).name
  end

  def booked_formatted_pax
    "Adults: #{booked.adults} / Children: #{booked.children} / Infants: #{booked.infants}"
  end

  def last_holiday
    @last_holiday ||= holidays.last
  end

  def search_formatted_pax
    "Adults: #{last_search.adults} / Children: #{last_search.children} / Infants: #{last_search.infants}"
  end
end
