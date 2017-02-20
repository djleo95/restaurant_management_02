class AdminsController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]

  def show
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user.present?
      flash[:danger] = t "flash.user_not_exist"
      redirect_to root_path
    end
  end
end
