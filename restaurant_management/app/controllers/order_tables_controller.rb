class OrderTablesController < ApplicationController
  def new
    @order_table = OrderTable.new
  end

  def create
    @order_table = OrderTable.new order_table_params
    from = params[:order_table][:day] + " " + params[:order_table][:book_from]
    to = params[:order_table][:day] + " " + params[:order_table][:book_to]
    @order_table.book_from = from.to_time
    @order_table.book_to = to.to_time
    if params[:guest_id]
      @order_table.target_type = Guest.name
      @order_table.target_id = params[:guest_id]
    elsif params[:user_id]
      @order_table.target_type = User.name
      @order_table.target_id = params[:user_id]
    end
    if @order_table.save
      if params[:to_home]
        redirect_to root_path
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
