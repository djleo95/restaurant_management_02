class OrderDishesController < ApplicationController
  def create
    @order_table = OrderTable.find_by id: params[:book_dish][:order_table_id]
    @order_dish = OrderDish.new order_dishes_params
    if @order_dish.save
      flash[:success] = t "flash.book_success"
    else
      flash[:danger] = t "error.book_fails"
    end
    redirect_to order_table_menus_path @order_table
  end

  private
  def order_dishes_params
    params.require(:book_dish).permit :quantity, :dish_id, :order_table_id
  end
end
