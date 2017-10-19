# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'a valid user' do
    let(:params) do
      {
        first_name: 'Test',
        surname: 'Testerson',
        email: 'test@test.com',
        domain: 'uk'
      }
    end
    let(:valid_user) { create(:user, params) }

    it 'has a first name' do
      expect(valid_user.first_name).to eq(params[:first_name])
    end

    it 'has a surname' do
      expect(valid_user.surname).to eq(params[:surname])
    end

    it 'has an email address' do
      expect(valid_user.email).to eq(params[:email])
    end

    it 'has a valid domain' do
      expect(valid_user.domain).to eq(params[:domain])
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

    it 'must have a valid domain' do
      expect(invalid_domain.errors).to have_key(:domain)
    end

    it 'does not save to the database' do
      expect { no_name }.not_to change { User.count }
    end
  end
end
