class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(current_user, @project), notice: "Profile successfully created!"
    else
      render action: :new, alert: "Profile couldn't be created!"
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_and_authorize_profile
    @profile = @user.profile
    authorize @profile
  end
end
