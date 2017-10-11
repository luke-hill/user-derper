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
end
