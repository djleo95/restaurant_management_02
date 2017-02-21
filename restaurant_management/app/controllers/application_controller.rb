class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def verify_admin
    redirect_to root_url unless current_user.isAdmin?
  end
end
