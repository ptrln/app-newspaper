class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.password == params[:password]
      login(user)
      redirect_to root_path
    else
      flash.now[:error] = "invalid login"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
