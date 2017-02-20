class Admin::StaffsController < ApplicationController
  before_action :find_staff, except: [:index, :new, :create]

  def index
    @staffs = Staff.paginate page: params[:page], per_page: Settings.Page.max[1]
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
end
