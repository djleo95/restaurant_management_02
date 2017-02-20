class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "flash.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user.present?
      flash[:danger] = t "flash.user_not_exist"
      redirect_to root_path
    end
  end
end
