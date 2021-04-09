class LocationGroupsController < AdminController
  before_action :set_location_group, only: [:show, :edit, :update, :destroy]

  # GET /location_groups
  def index
    @location_groups = LocationGroup.all
  end

  # GET /location_groups/1
  def show
  end

  # GET /location_groups/new
  def new
    @location_group = LocationGroup.new
  end

  # GET /location_groups/1/edit
  def edit
  end

  # POST /location_groups
  def create
    @location_group = LocationGroup.new(location_group_params)

    if @location_group.save
      redirect_to @location_group, notice: 'Location group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /location_groups/1
  def update
    if @location_group.update(location_group_params)
      redirect_to @location_group, notice: 'Location group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /location_groups/1
  def destroy
    @location_group.destroy
    redirect_to location_groups_url, notice: 'Location group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_group
      @location_group = LocationGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_group_params
      params.require(:location_group).permit(:title, :profile_id)
    end
end
