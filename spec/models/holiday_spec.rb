require 'rails_helper'

RSpec.describe Holiday, type: :model do
  context 'a valid holiday' do
    let(:valid_holiday) { create(:holiday) }

    it 'has an MYB number' do
      expect(valid_holiday.myb).not_to be_nil
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
