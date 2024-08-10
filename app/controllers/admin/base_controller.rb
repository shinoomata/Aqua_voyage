# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: '管理者権限が必要です' unless current_user&.admin?
  end
end
