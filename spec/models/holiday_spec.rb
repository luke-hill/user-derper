require 'rails_helper'

RSpec.describe Holiday, type: :model do
  context 'a valid holiday' do
    let(:valid_holiday) do
      Holiday.create(
        myb: 'MYB1B',
        user_id: 11,
        search_id: 109
      )
    end

    it 'has an MYB number first name' do
      expect(valid_holiday.myb).to eq('MYB1B')
    end

    it 'saves to the database' do
      expect { valid_holiday }.to change { Holiday.count }.by(1)
    end
  end

  context 'an invalid holiday' do
    let(:invalid_holiday) do
      Holiday.create(
        myb: '',
        user_id: nil,
        search_id: nil
      )
    end

    it 'must have all attributes' do
      expect(invalid_holiday.errors.keys.length).to eq 3
    end

    it 'does not save to the database' do
      expect { invalid_holiday }.not_to change { Holiday.count }
    end
  end
end