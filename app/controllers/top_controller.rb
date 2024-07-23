class TopController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index] # indexアクションを認証なしでアクセス可能にする
  def index; end
end
