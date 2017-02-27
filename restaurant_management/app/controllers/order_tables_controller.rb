class OrderTablesController < ApplicationController
  def new
    @order_table = OrderTable.new
    if params[:guest_id]
      @guest = Guest.find_by id: params[:guest_id]
    elsif current_user
      @user = current_user
    end
  end

  def create
    @order_table = OrderTable.new order_table_params
    from = params[:order_table][:day] + " " + params[:order_table][:book_from]
    to = params[:order_table][:day] + " " + params[:order_table][:book_to]
    @order_table.book_from = from.to_time
    @order_table.book_to = to.to_time
    @target = nil
    if params[:guest_id]
      @order_table.target_type = Guest.name
      @order_table.target_id = params[:guest_id]
      @target = Guest.find_by id: params[:guest_id]
    elsif params[:user_id]
      @order_table.target_type = User.name
      @order_table.target_id = params[:user_id]
      @target = current_user
    end
    if @order_table.save
      BookMailer.book_email(@target).deliver
      if params[:to_home]
        redirect_to root_path
      else
        redirect_to order_table_menus_path @order_table
      end
    else
      render :new
    end
  end

  private
  def order_table_params
    params.require(:order_table).permit :day, :book_from, :book_to, :table_id
  end
end
