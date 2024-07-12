class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: '1091773062747-mnntc5jeqlstt8fhslljg1omkn6hmirn.apps.googleusercontent.com')
    user = User.find_or_create_by(email: payload['email'])
    session[:user_id] = user.id
    redirect_to after_login_path, notice: 'ログインしました'
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, notice: '不正なアクセスです'
    end
  end
end
