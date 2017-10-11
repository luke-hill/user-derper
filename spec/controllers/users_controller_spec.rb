require 'rails_helper'

require_relative '../../app/controllers/users_controller'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}

      expect(response).to be_success
    end

    it 'assigns the @users instance variable' do
      get :index, params: {}

      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe 'GET #show' do
    let(:new_user) { User.create!(first_name: 'test', surname: 'test', email: 'test') }
    it 'returns a success response' do
      get :show, params: { id: new_user.id }

      expect(response).to be_success
    end
  end
end
