class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by name: params[:session][:name].downcase
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to "/"
    else
      flash[:danger] = "Invalid email/password combination"
      render :login
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to "/login"
  end
end
