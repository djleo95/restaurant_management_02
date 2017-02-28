class Admin::MenusController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:update, :create, :destroy]
  before_action :find_menu, except: [:index, :new, :create]

  def index
    @menus = if params[:term]
      Menu.search params[:term]
    else
      Menu.all
    end.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @menu = Menu.includes(:dishes).find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      flash[:success] = t "flash.menu.create_success"
      redirect_to admin_menus_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update_attributes menu_params
      flash[:success] = t "flash.menu.update_success"
      redirect_to admin_menu_path @menu
    else
      render :edit
    end
  end

  def destroy
    if @menu.destroy
      flash[:success] =  t "flash.menu.destroy_success"
    else
      flash[:danger] = t "flash.menu.destroy_fail"
    end
    redirect_to admin_menus_path
  end

  private
  def menu_params
    params.require(:menu).permit :name, :description,
      {dish_ids: []}
  end

  def find_menu
    @menu = Menu.find_by id: params[:id]
    unless @menu
      flash[:danger] = t "flash.menu.find_fail"
      redirect_to admin_menus_path
    end
  end
end
