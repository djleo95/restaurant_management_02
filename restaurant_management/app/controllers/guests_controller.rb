class GuestsController < ApplicationController
  def create
    @guest = Guest.new guest_params
    if @guest.save
      flash[:success] = t "flash.step3"
      redirect_to @user
    else
      render :new
    end
  end

  def new
    @guest = Guest.new
  end

  private
  def guest_params
    params.require(:guest).permit :name, :email, :phone
  end
end
