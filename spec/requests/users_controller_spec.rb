require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { create(:user, name: 'Test User') }
  let(:non_admin_user) { create(:user) }
  let(:admin_user) { create(:user, admin: true) }

  before(:each) do
    @user = User.find_or_create_by(email: 'test@example.com') do |user|
      user.password = 'password123'
      user.username = 'testuser'
    end

    sign_in @user
  end

  describe 'GET #show' do
    it 'ユーザーがログインしている場合、ユーザーの詳細が表示されること' do
      get user_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@user.email)
    end

    it 'ログインしていない場合、ログインページにリダイレクトされること' do
      sign_out @user
      get user_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #edit' do
    it 'ユーザーがログインしている場合、編集ページが表示されること' do
      get edit_user_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('プロフィール編集')
    end

    it 'ログインしていない場合、ログインページにリダイレクトされること' do
      sign_out @user
      get edit_user_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'PATCH #update' do
    it '有効な属性の場合 ユーザー名が更新されること' do
      patch user_path, params: { user: { name: '新しい名前' } }
      expect(response).to redirect_to(user_path(@user))
      follow_redirect!
      expect(response.body).to include('新しい名前')
    end

    it '無効な属性の場合 更新に失敗し、編集ページが再表示されること' do
      patch user_path, params: { user: { name: '' } }
      follow_redirect!
      expect(response.body).to include('編集')  # エラーメッセージが表示されていることを確認
    end
  end

  describe 'DELETE #destroy_user' do
    context '管理者ユーザーの場合' do
      before do
        sign_in admin_user
      end

      it 'ユーザーを削除できること' do
        delete destroy_user_admin_user_path(user)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_users_path)

        expect(User.exists?(user.id)).to be_falsey
      end
    end

    context '非管理者ユーザーの場合' do
      before do
        sign_in non_admin_user  # 非管理者ユーザーとしてログイン
      end

      it '削除に失敗し、ルートページにリダイレクトされること' do
        delete destroy_user_admin_user_path(user)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
