require 'rails_helper'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  context 'a valid user' do
    let(:valid_user) { User.create(first_name: 'Test', surname: 'Testerson', email: 'test@test.com', domain: 'uk') }

    it 'must have a first name' do
      expect(valid_user.first_name).to eq('Test')
    end

    it 'must have a surname' do
      expect(valid_user.surname).to eq('Testerson')
    end

    it 'must have an email address' do
      expect(valid_user.email).to eq('test@test.com')
    end

    it 'must have a valid domain' do
      expect(valid_user.domain).to eq('uk')
    end

    it 'saves to the database' do
      expect { valid_user }.to change { User.count }.by(1)
    end
  end

  context 'an invalid user' do
    let(:no_name) { User.create(first_name: '', surname: 'Testerson', email: 'test@test.com', domain: 'uk') }
    let(:no_surname) { User.create(first_name: 'Test', surname: '', email: 'test@test.com', domain: 'uk') }
    let(:no_email) { User.create(first_name: 'Test', surname: 'Testerson', email: '', domain: 'uk') }
    let(:invalid_domain) { User.create(first_name: 'Test', surname: 'Testerson', email: '', domain: 'engerland') }

    it 'must have a first name' do
      expect(no_name.errors).to have_key(:first_name)
    end

    it 'must have a surname' do
      expect(no_surname.errors).to have_key(:surname)
    end

    it 'must have an email address' do
      expect(no_email.errors).to have_key(:email)
    end

    it 'does not save to the database' do
      expect { no_name }.not_to change { User.count }
    end
  end
end
