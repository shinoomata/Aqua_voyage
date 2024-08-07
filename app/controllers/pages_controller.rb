class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:terms]

  def terms; end
end
