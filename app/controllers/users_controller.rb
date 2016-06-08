class UsersController < ApplicationController

  def index
    @users = User.all.order('created_at DESC')
    @posts = Post.all
    @post = Post.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def new
    @users = User.all
    @user = User.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    # @post = Post.find(params[:id])
  end

  def create
    @users = User.all
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @user = User.new(user_params)
    if @user.save
      # flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @users = User.all
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end


  def update
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @users = User.all
    @user = User.find(params[:id])
     if @user.update_attributes(params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :native_language,
        :role,
        :tier_level,
        :born_on,
        :transportation,
        :ign,
        :location,
        :profile_image,
        :description
    ))
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end



private
    # Implement Strong Params
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :native_language,
      :role,
      :tier_level,
      :born_on,
      :transportation,
      :ign,
      :location,
      :profile_image,
      :description
  )
  end

end
