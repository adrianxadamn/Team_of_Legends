class HomepageController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def new
    @user = User.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def show
    @user = User.find(params[:id])
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end


  def update
    @user = User.find(params[:id])
    if current_user == @user
      @user.update_attributes(params.require(:user).permit(
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

      redirect_to root_path

    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    # flash[:success] = "You have been logged out"
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
