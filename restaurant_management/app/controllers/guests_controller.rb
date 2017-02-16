class GuestsController < ApplicationController
  def create
    @guest = Guest.new guest_params
    if @guest.save
      redirect_to new_guest_order_table_path @guest
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
