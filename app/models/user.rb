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
      where: search_location,
      pax: search_formatted_pax
    }
  end

  def user_name
    first_name.capitalize + ' ' + surname
  end

  def last_holiday_info
    {
      order_id: last_holiday.myb,
      order_date: last_holiday.created_at,
      nights: booked.nights,
      dep_date: booked.departure_date,
      arr_date: (booked.departure_date + booked.nights),
      hol_type: booked.holiday_type,
      where: booked_location,
      hotel: booked_hotel,
      pax: booked_formatted_pax
    }
  end

  def booked
    booked_search = holidays.last.search_id
    @last_booked = Search.find(booked_search)
  end

  private

  def booked_hotel
    Hotel.find(booked.hotel_id).name
  end

  def  booked_location
    Destination.find(booked.destination_id).name
  end

  def  booked_formatted_pax
    "Adults: #{booked.adults} / Children: #{booked.children} / Infants: #{booked.infants}"
  end


  def search_location
    Destination.find(last_search.destination_id).name
  end

  def search_formatted_pax
    "Adults: #{last_search.adults} / Children: #{last_search.children} / Infants: #{last_search.infants}"
  end

  def last_search
    @last_search ||= searches.last
  end

  def last_holiday
    @last_holiday ||= holidays.last
  end

  def holidays?
    holidays.count > 0
  end

  private

  def formatted_pax
    "#{last_search.adults}/#{last_search.children}/#{last_search.infants}"
  end
end
