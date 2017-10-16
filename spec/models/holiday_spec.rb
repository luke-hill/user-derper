require 'rails_helper'

RSpec.describe Holiday, type: :model do
  context 'a valid holiday' do
    let(:hotel_ish) { create(:hotel) }
    let(:search_with_hotel) { create(:search, destination: hotel_ish.destination, hotel: hotel_ish) }
    let(:valid_holiday) { create(:holiday, search: search_with_hotel) }

    it 'has an MYB number' do
      p '****'
      hotel = hotel_ish
      p hotel
      p hotel.destination
      p '****'
      search = search_with_hotel
      p search
      p '***'
      holiday = valid_holiday
      p holiday
      p holiday.search
      p holiday.search.destination.hotels
      p holiday.search.hotel
      
      expect(valid_holiday.myb).to eq('MYB1B')
    end

    it 'saves to the database' do
      expect { valid_holiday }.to change { Holiday.count }.by(1)
    end
  end

  context 'an invalid holiday' do
    let(:invalid_holiday) { Holiday.create }

    it 'must have all attributes' do
      expect(invalid_holiday.errors.keys.length).to eq 5
    end

    it 'does not save to the database' do
      expect { invalid_holiday }.not_to change { Holiday.count }
    end
  end
end
