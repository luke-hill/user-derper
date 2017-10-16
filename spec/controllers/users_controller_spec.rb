require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_user) { create(:user) }

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
    let(:valid_params) { { first_name: 'test', surname: 'test', email: 'test@test.com', domain: 'uk' } }

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
          domain: 'uk'
        }
      end

      it 'redirect to the posts page' do
        put :update, params: { id: valid_user.id, user: new_params }

        expect(response).to redirect_to :users
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { first_name: '', surname: '', email: '', domain: '' } }

      it 'will re-render the edit page' do
        put :update, params: { id: valid_user.id, user: invalid_params }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      it 'destroys the requested post' do
        valid_user

        expect { delete :destroy, params: { id: valid_user.id } }.to change { User.count }.by(-1)
      end

      it 'redirects to the posts list' do
        delete :destroy, params: { id: valid_user.id }

        expect(response).to redirect_to(users_url)
      end
    end
  end
end
