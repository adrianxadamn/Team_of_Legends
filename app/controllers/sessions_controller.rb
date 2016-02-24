class SessionsController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      render 'new'
    end
  end




  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  def edit
  end

end
