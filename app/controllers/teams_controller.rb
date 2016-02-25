class TeamsController < ApplicationController
   def index
    @users = User.all.order('created_at DESC')
    @posts = Post.all
    @recentUsers = User.order('created_at DESC').limit(5)
    @team = Team.new
    @teams = Team.all
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    @team.owner = @user
    if @team.save
      redirect_to root_path
    else
      render 'new'
    end
  end




  private
  # Implement Strong Params
  def team_params
    params.require(:team).permit(
      :name,
      :location,
      :native_langauge,
      :members,
      :user_id,
      :team_image,
      :established_on,
      :description,
      :team_abbreviation
  )

  end

end
