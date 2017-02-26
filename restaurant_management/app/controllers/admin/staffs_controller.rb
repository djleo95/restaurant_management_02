class Admin::StaffsController < ApplicationController
  before_action :verify_admin, only: [:update, :create, :destroy]
  before_action :find_staff, except: [:index, :new, :create]
  before_action :load_role, only: [:new, :edit]

  def index
    @staffs = Staff.paginate page: params[:page], per_page: Settings.page.max[1]
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new staff_params
    if @staff.save
      flash[:success] = t "flash.new_staff"
      StaffMailer.staff_email(@staff).deliver
      redirect_to admin_staffs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @staff.update_attributes staff_params
      flash[:success] = t "dialog.success"
      redirect_to admin_staffs_path
    else
      flash[:danger] = t "dialog.fail"
      render :edit
    end
  end

  def destroy
    @staff.destroy
    redirect_to :back
  end

  private
  def find_staff
    @staff = Staff.find_by id: params[:id]
    unless @staff
      flash[:danger] = t "flash.staff"
      redirect_to :back
    end
  end

  def staff_params
    params.require(:staff).permit :name, :email, :salary,
      :work_days, :role_id
  end

  def load_role
    @role = Role.all.collect { |p| [ p.name, p.id ] }
  end
end
