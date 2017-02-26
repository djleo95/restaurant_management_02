class Admin::BillsController < ApplicationController
  before_action :verify_admin
  before_action :find_bill, except: [:index, :new, :create]
  before_action :load_dish, only: [:new, :edit]
  before_action :load_staff, only: [:new, :edit]

  def index
    @bills = Bill.paginate page: params[:page], per_page: Settings.page.max[1]
  end

  def new
    @bill = Bill.new
    3.times do
      bill_detail = @bill.bill_details.build
    end
    @select = [["Guest", "Guest"], ["User", "User"]]
    if params[:bill]
      @target_type = String params[:bill][:target_type]
      @select1 = Staff.all.map { |staff| [staff.name, staff.id] }
      @user = User.all.map { |user| [user.name, user.id] }
    else
      @target_type = "none"
    end
  end

  def create
    @bill = Bill.new bill_params
    if @bill.target_type == "Guest"
      @bill.target_id = Integer (Guest.last.id)
    end
    byebug
    if @bill.save
        redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  # end
  #
  # def update
  #   if @bill.target_type == "Guest"
  #     @bill.target_id = Integer (Guest.last.id)
  #   end
  #   if @bill.update_attributes bill_params
  #     flash[:success] = t "dialog.success"
  #     redirect_to admin_bills_path
  #   else
  #     flash[:danger] = t "dialog.fail"
  #     render :edit
  #   end
  # end

  def destroy
    @bill.destroy
    redirect_to :back
  end

  private
  def find_bill
    @bill = Bill.find_by id: params[:id]
    unless @bill
      flash[:danger] = t "flash.staff"
      redirect_to :back
    end
  end

  def bill_params
    params.require(:bill).permit :target_type, :staff_id, :target_id,
      bill_details_attributes: [:user_id, :dish_id, :quantity, '_destroy']
  end

  def load_dish
    @dish = Dish.all.map { |a| [a.name, a.id] }
  end

  def load_staff
    @staff = Staff.all.map { |a| [a.name, a.id] }
  end
end
