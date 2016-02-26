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
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
    @user = current_user
    @teams = Team.all
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
    if current_user.id != @team.user_id || current_user.try(:admin?)
      redirect_to teams_path
    end
  end

  def update
    @recentusers = User.order('created_at DESC').limit(5)
    @recentteams = Team.order('created_at DESC').limit(3)
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

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
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
