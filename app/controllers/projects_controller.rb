class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects
    authorize @user, :index_projects?
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(current_user, @project), notice: 'Profile successfully created!'
    else
      render action: :new, alert: "Profile couldn't be created!"
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @floorplans = @project.floorplans
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
