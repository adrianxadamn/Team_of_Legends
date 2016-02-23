class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(user_id: current_user.id,
                            content: params[:post][:content])
    if @post.save
      flash[:notice] = "You've made that flippin' comment!"
      redirect_to root_path
    else
      render :new
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
