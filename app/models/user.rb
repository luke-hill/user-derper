# frozen_string_literal: true

class User < ApplicationRecord
  has_many :holidays
  has_many :searches
  has_many :login_histories

  include ActionView::Helpers

  scope :uk, -> { where(domain: 'uk') }
  scope :se, -> { where(domain: 'se') }
  scope :no, -> { where(domain: 'no') }

  validates :first_name, :surname, :email, presence: true
  validates :domain, format: { with: /\A(uk|se|no)\z/, message: 'is invalid' }

  def self.search(search)
    where('first_name like ? or surname like ? or email like ? or domain like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

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
    @last_holiday_info ||= {
      myb: last_holiday.myb,
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

  def time_since_last_login
    if never_logged_in? || days_since_last_login >= 60
      '<span class="warning">User has not logged in recently</span>'.html_safe
    elsif days_since_last_login >= 1
      "#{pluralize(days_hours.first, 'Day')}"\
      " #{pluralize(days_hours.last, 'Hour')}"
    elsif hours_since_last_login >= 1
      pluralize(days_hours.last, 'Hour').to_s
    else
      'Less than an Hour'
    end
  end

  def last_holiday_flo?
    booked.holiday_type == 'FLO'
  end

  private

  def never_logged_in?
    login_histories.empty?
  end

  def days_hours
    days = days_since_last_login.to_i
    hours = (hours_since_last_login - (hours_in_day * days)).to_i
    [days, hours]
  end

  def hours_since_last_login
    days_since_last_login * hours_in_day
  end

  def days_since_last_login
    DateTime.now - last_login_date.to_datetime
  end

  def last_login_date
    login_histories.last.logged_in
  end

  def return_date
    booked.departure_date + booked.nights
  end

  def booked
    @booked ||= Search.find(holidays.last.search_id)
  end

  def booked_hotel
    Hotel.find(booked.hotel_id).name unless last_holiday_flo?
  end

  def booked_location
    Destination.find(booked.destination_id).name
  end

  def booked_formatted_pax
    "Adults: #{booked.adults} / Children: #{booked.children} / "\
    "Infants: #{booked.infants}"
  end

  def last_holiday
    @last_holiday ||= holidays.last
  end

  def search_formatted_pax
    "Adults: #{last_search.adults} / Children: #{last_search.children} / "\
    "Infants: #{last_search.infants}"
  end
end
