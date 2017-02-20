class StaffsController < ApplicationController
  def index
    @staffs = Staff.paginate page: params[:page]
  end
end
