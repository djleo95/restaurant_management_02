class SessionsController < ApplicationController
  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.isAdmin?
        redirect_to admin_path user
      else
        redirect_to user
      end
    else
      flash.now[:danger] = t "flash.wrong_pass"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
