require 'rails_helper'

require_relative '../../app/controllers/users_controller'

RSpec.describe UsersController, type: :controller do
  let(:valid_user) { User.create(first_name: 'test', surname: 'test', email: 'test@test.com') }

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
    it 'returns a success response' do
      get :show, params: { id: valid_user.id }

      expect(response).to be_success
    end

    it 'blows up with an invalid input' do
      expect { get :show, params: { id: 0 } }
        .to raise_error(ActiveRecord::RecordNotFound)
        .with_message("Couldn't find User with 'id'=0")
    end
  end

  describe 'PUT #edit' do
    let(:valid_params) { { first_name: 'test', surname: 'test', email: 'test@test.com' } }

    it 'returns a success response' do
      put :edit, params: { id: valid_user.id, user: { params: valid_params } }

      expect(response).to be_success
    end

    it 'renders the edit page' do
      put :edit, params: { id: valid_user.id, user: { params: valid_params } }

      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_params) do
        {
          first_name: 'new name',
          surname: 'new surname',
          email: 'test_updated@test.com',
        }
      end

      it 'returns a success response' do
        put :update, params: { id: valid_user.id, user: new_params }

        expect(response).to be_success
      end

      it 'redirect to the posts page' do
        put :update, params: { id: valid_user.id, user: new_params }

        expect(response).to redirect_to :users
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { first_name: '', surname: '', email: '' } }

      it 'will re-render the edit page' do
        put :update, params: { id: valid_user.id, user: invalid_params }

        expect(response).to render_template :edit
      end
    end
  end
end
