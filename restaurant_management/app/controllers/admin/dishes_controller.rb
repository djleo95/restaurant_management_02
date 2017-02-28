class Admin::DishesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:update, :create, :destroy]
  before_action :load_category, except: [:index, :show, :destroy]
  before_action :find_category, except: [:index]
  before_action :find_menu_dish, only: [:destroy, :new]
  before_action :find_dish, except: [:index, :new]

  def index
    @dishes = if params[:search]
      Dish.search params[:search]
    else
      Dish.all
    end.paginate page: params[:page]
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    if @category
      @dish = @category.dishes.build dish_params
      if @dish.save
        flash[:success] = t "flash.dish.create_success"
        redirect_to admin_category_path @category
      end
    else
      @dish = Dish.new dish_params
      if @dish.save
        flash[:success] = t "flash.dish.create_success"
        redirect_to admin_dishes_path
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    @dish.category_id = params[:category_id]
    if @dish.update_attributes dish_params
      flash[:success] = t "flash.dish.update_success"
      if @category
        redirect_to admin_category_path @category
      else
        redirect_to admin_dishes_path
      end
    else
      render :edit
    end
  end

  def destroy
    if @menu
      @menu.dishes.include?(@dish)
      if @menu.dishes.delete @dish
        redirect_to admin_menu_path @menu
      end
    else
      if @dish.destroy
        flash[:success] = t "flash.dish.destroy_success"
      else
        flash[:danger] = t "flash.dish.destroy_fail"
      end
      if @category
        redirect_to admin_category_path @category
      else
        redirect_to admin_dishes_path
      end
    end
  end

  private
  def dish_params
    params.require(:dish).permit :name, :price, :description, :category_id
  end

  def find_category
    @category = Category.find_by id: params[:category_id]
    unless @category
      # flash[:danger] = t "flash.category.find_fail"
    end
  end

  def find_dish
    @dish = if @category
      @category.dishes.find_by id: params[:id]
    else
      Dish.find_by id: params[:id]
    end
    unless @dish
      # flash[:danger] = t "flash.dish.find_fail"
    end
  end

  def find_menu_dish
    @menu = Menu.find_by id: params[:menu_id]
    unless @menu
      # flash[:danger] = t "flash.menu.find_fail"
    end
    @dish = Dish.find_by id: params[:id]
    unless @dish
      # flash[:danger] = t "flash.dish.find_fail"
    end
  end

  def load_category
    @categories = Category.all.map {|p| [p.name, p.id]}
  end
end
