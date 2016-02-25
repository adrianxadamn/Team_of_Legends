class TeamsController < ApplicationController
   def index
    @users = User.all.order('created_at DESC')
    @posts = Post.all
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @team = Team.new
    @teams = Team.order('created_at DESC')
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    @team.owner = @user
    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def show
    @teams = Team.all
    @team = Team.find(params[:id])
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def edit
    @teams = Team.all
    @team = Team.find(params[:id])
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
  end

  def update
    @teams = Team.all
    @team = Team.find(params[:id])
     if @team.update_attributes(params.require(:team).permit(
      :name,
      :location,
      :native_language,
      :members,
      :user_id,
      :team_image,
      :established_on,
      :description,
      :team_abbreviation
    ))
      redirect_to teams_path
    else
      render :edit
    end
  end


  private
  # Implement Strong Params
  def team_params
    params.require(:team).permit(
      :name,
      :location,
      :native_language,
      :members,
      :user_id,
      :team_image,
      :established_on,
      :description,
      :team_abbreviation
  )

  end

end
