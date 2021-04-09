class WorkGroupsController < AdminController
  before_action :set_work_group, only: [:show, :edit, :update, :destroy]

  # GET /work_groups
  def index
    @work_groups = WorkGroup.all
  end

  # GET /work_groups/1
  def show
  end

  # GET /work_groups/new
  def new
    @work_group = WorkGroup.new
  end

  # GET /work_groups/1/edit
  def edit
  end

  # POST /work_groups
  def create
    @work_group = WorkGroup.new(work_group_params)

    if @work_group.save
      redirect_to @work_group, notice: 'Work group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /work_groups/1
  def update
    if @work_group.update(work_group_params)
      redirect_to @work_group, notice: 'Work group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /work_groups/1
  def destroy
    @work_group.destroy
    redirect_to :work_groups, notice: 'Work group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_group
      @work_group = WorkGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_group_params
      params.require(:work_group).permit(:title, :profile_id)
    end
end
