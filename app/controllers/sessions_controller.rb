class SessionsController < ApplicationController
  def google_auth
    user_info = request.env['omniauth.auth']
    user = User.find_or_create_by(email: user_info['info']['email']) do |u|
      u.name = user_info['info']['name']
      u.image = user_info['info']['image']
      u.password = SecureRandom.hex(15)
    end

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      redirect_to root_path, alert: 'ログインに失敗しました。'
    end
  end
end
