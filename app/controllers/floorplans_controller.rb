class FloorplansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_floorplan, only: %i[show edit update]

  def index
    @projects = @project.floorplans.all
  end

  def show; end

  def new
    @floorplan = Floorplan.new
    authorize @project, :new_floorplan?
  end

  def create
    @floorplan = @project.floorplans.new(floorplan_params)

    if @floorplan.save
      redirect_to user_project_path(current_user, @project), notice: 'Floorplan successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @floorplan.update(floorplan_params)
      redirect_to @floorplan, notice: 'Floorplan was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_floorplan
    @floorplan = @project.floorplans.find(params[:id])
    authorize @floorplan
  end

  def floorplan_params
    params.require(:floorplan).permit(:image, :image_data, :display_name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
