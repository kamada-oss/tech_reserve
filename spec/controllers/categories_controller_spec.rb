require 'rails_helper'

describe CategoriesController do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  # GET #new
  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        login user
        get :index
      end

      it 'index.html.erbに遷移すること' do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      before do
        get :index
      end

      it 'トップページにリダイレクトされること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # GET #show
  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        login user
        get :show, params: {  id: category }
      end

      it 'index.html.erbに遷移すること' do
        expect(response).to render_template :show, params: {  id: category }
      end
    end

    context 'ログインしていない場合' do
      before do
        category = create(:category)
        get :show, params: {  id: category }
      end

      it 'トップページにリダイレクトされること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end