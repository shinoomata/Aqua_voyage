require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  let(:aquarium) { create(:aquarium) }
  let(:user) { create(:user) }
  let(:review) { create(:review, aquarium:, user:) }
  let(:other_user) { create(:user) }

  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '新しいレビュー作成ページが表示されること' do
        get new_aquarium_review_path(aquarium)
        expect(response).to have_http_status(:success)
        expect(response.body).to include('レビューを投稿')
      end
    end

    context 'ログインしていない場合' do
      before do
        sign_out user
      end

      it 'ログインページにリダイレクトされること' do
        get new_aquarium_review_path(aquarium)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      context '有効なパラメータの場合' do
        it 'レビューが作成されること' do
          expect do
            post aquarium_reviews_path(aquarium), params: {
              review: { content: '素晴らしい水族館です！', target_audience_id: 1, size_rating_id: 1, highlight_id: 1 },
              aquarium: { tag_list: '新しいタグ1,新しいタグ2' }
            }
          end.to change(Review, :count).by(1)
          expect(response).to redirect_to(aquarium)
          expect(flash[:notice]).to eq('レビューが正常に投稿されました。')
        end
      end

      context '無効なパラメータの場合' do
        it 'レビュー作成に失敗し、新規作成ページが再表示されること' do
          post aquarium_reviews_path(aquarium), params: {
            review: { content: '', target_audience_id: '', size_rating_id: '', highlight_id: '' }
          }
          expect(response).to have_http_status(:ok)
          expect(response.body).to include('全ての項目を選択してください')
        end
      end
    end

    context 'ログインしていない場合' do
      before do
        sign_out user
      end

      it 'ログインページにリダイレクトされること' do
        post aquarium_reviews_path(aquarium), params: { review: { content: '素晴らしい水族館です！', target_audience_id: 1, size_rating_id: 1, highlight_id: 1 } }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context '投稿者がログインしている場合' do
      before do
        sign_in user
      end

      it 'レビュー編集ページが表示されること' do
        get edit_aquarium_review_path(aquarium, review)
        expect(response).to have_http_status(:success)
        expect(response.body).to include('編集')
      end
    end

    context '他のユーザーがログインしている場合' do
      before do
        sign_in other_user
      end

      it '編集権限がないため水族館詳細ページにリダイレクトされること' do
        get edit_aquarium_review_path(aquarium, review)
        expect(response).to redirect_to(aquarium)
        expect(flash[:alert]).to eq('編集権限がありません。')
      end
    end
  end

  describe 'PATCH #update' do
    context '投稿者がログインしている場合' do
      before do
        sign_in user
      end

      context '有効なパラメータの場合' do
        it 'レビューが更新されること' do
          patch aquarium_review_path(aquarium, review), params: { review: { content: '更新されたレビュー内容です！' } }
          expect(response).to redirect_to(aquarium)
          expect(flash[:notice]).to eq('レビューが正常に更新されました。')
          expect(review.reload.content).to eq('更新されたレビュー内容です！')
        end
      end

      context '無効なパラメータの場合' do
        it 'レビュー更新に失敗し、編集ページが再表示されること' do
          patch aquarium_review_path(aquarium, review), params: { review: { content: '', target_audience_id: '', size_rating_id: '', highlight_id: '' } }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('全ての項目を選択してください')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context '投稿者がログインしている場合' do
      before do
        sign_in user
      end

      it 'レビューが削除されること' do
        delete aquarium_review_path(aquarium, review)
        expect(response).to redirect_to(aquarium)
        expect(flash[:notice]).to eq('レビューを削除しました')
        expect(Review.exists?(review.id)).to be_falsey
      end
    end

    context '他のユーザーがログインしている場合' do
      before do
        sign_in other_user
      end

      it '削除権限がないため水族館詳細ページにリダイレクトされること' do
        delete aquarium_review_path(aquarium, review)
        expect(response).to redirect_to(aquarium)
        expect(flash[:alert]).to eq('編集権限がありません。')
      end
    end
  end
end
