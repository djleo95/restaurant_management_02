class Admin::BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = OrderTable.new bill_params
    from = params[:bill][:day] + " " + params[:bill][:book_from]
    to = params[:bill][:day] + " " + params[:bill][:book_to]
    @bill.book_from = from.to_time
    @bill.book_to = to.to_time
    if params[:guest_id]
      @bill.target_type = Guest.name
      @bill.target_id = params[:guest_id]
    elsif params[:user_id]
      @bill.target_type = User.name
      @bill.target_id = params[:user_id]
    end
    if @bill.save
      if params[:to_home]
        redirect_to root_path
      end
    else
      render :new
    end
  end

  private
  def bill_params
    params.require(:bill).permit :day, :book_from, :book_to, :table_id
  end
end
