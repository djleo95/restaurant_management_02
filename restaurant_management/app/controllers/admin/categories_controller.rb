class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:update, :create, :destroy]
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = if params[:search]
      Category.search params[:search]
    else
      Category.all
    end.paginate page: params[:page]
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.category.create_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.category.update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "flash.category.delete_success"
    else
      flash[:danger] = t "flash.category.delete_fail"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t "flash.category.find_fail"
      redirect_to admin_categories_path
    end
  end
end
