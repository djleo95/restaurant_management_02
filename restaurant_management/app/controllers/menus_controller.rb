class MenusController < ApplicationController
  def index
    @dishes = Dish.paginate page: params[:page], per_page: Settings.menu.number_item_in_page
  end
end
