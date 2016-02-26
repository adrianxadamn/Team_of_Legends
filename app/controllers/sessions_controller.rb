class SessionsController < ApplicationController

  def new
    @users = User.all
    @user = User.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
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
