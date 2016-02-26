class PostsController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
    @posts = Post.find(params[:id])
    @post = Post.new
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def show
    @users = User.all
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @user = current_user
    @posts = Post.all
    @post = @user.posts.new(user_id: current_user.id,
                            content: params[:post][:content])
    if @post.save
      flash[:notice] = "You've made that flippin' comment!"
      redirect_to root_path
    else
      render :new
      flash[:notice] = "Your post cannot be blank!"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @users = User.all
    @user = User.find(params[:user_id])
    if current_user != @user
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def update
    # doesn't even reach here


    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    if @user.post.update_attribute(params.require(:post).permit(
        :content))
      redirect_to root_path
    else
      render :edit
    end
  end

private
    # Implement Strong Params
  def post_params
    params.require(:post).permit(
      :content, :user_id
  )
  end


end
