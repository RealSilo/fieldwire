class FloorplansController < ApplicationController
  before_action :set_project
  before_action :set_floorplan, only: [:show, :edit, :update, :destroy]

  # GET /floorplans
  # GET /floorplans.json
  def index
    @projects = @project.floorplans.all
  end

  # GET /floorplans/1
  # GET /floorplans/1.json
  def show
  end

  # GET /floorplans/new
  def new
    @floorplan = Floorplan.new
  end

  # GET /floorplans/1/edit
  def edit
  end

  # POST /floorplans
  # POST /floorplans.json
  def create
    @floorplan = @project.floorplans.new(floorplan_params)

    respond_to do |format|
      if @floorplan.save
        format.html { redirect_to user_project_path(current_user, @project), notice: 'floorplan was successfully created.' }
        format.json { render :show, status: :created, location: [@project, @floorplan] }
      else
        format.html { render :new }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floorplans/1
  # PATCH/PUT /floorplans/1.json
  def update
    respond_to do |format|
      if @floorplan.update(floorplan_params)
        format.html { redirect_to @floorplan, notice: 'Floorplan was successfully updated.' }
        format.json { render :show, status: :ok, location: [@project, @floorplan] }
      else
        format.html { render :edit }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floorplans/1
  # DELETE /floorplans/1.json
  def destroy
    @floorplan.destroy
    respond_to do |format|
      format.html { redirect_to floorplans_url, notice: 'Floorplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_floorplan
    @floorplan = @project.floorplans.find(params[:id])
  end

  def floorplan_params
    params.require(:floorplan).permit(:image, :image_data, :display_name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end