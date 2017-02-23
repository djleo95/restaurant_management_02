class GuestsController < ApplicationController
  def create
    @guest = Guest.new guest_params
    if @guest.save
      if params[:guest][:review_attributes]  
        redirect_to reviews_path
      else
        redirect_to new_guest_order_table_path @guest
      end
    else
      if params[:guest][:review_attributes]
        redirect_to new_review_path
      else
        render :new
      end
    end
  end

  def new
    @guest = Guest.new
  end

  private
  def guest_params
    params.require(:guest).permit :name, :email, :phone, review_attributes: [:content]
  end
end
