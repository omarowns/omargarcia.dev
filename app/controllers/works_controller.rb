class WorksController < AdminController
  before_action :work, only: [:show, :edit, :update, :destroy]
  before_action :work_group, only: [:index, :new, :create, :show, :destroy]


  # GET /works
  def index
    @works = Work.all
  end

  # GET /works/1
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to @work, notice: 'Work was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      redirect_to @work, notice: 'Work was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
    redirect_to [@work_group, :works], notice: 'Work was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def work
      @work ||= Work.find(params[:id])
    end

    def work_group
      @work_group ||= WorkGroup.find_by(id: params[:work_group_id]) || work.work_group
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:title, :additional, :link, :duration, :image_pack_tag, :work_group_id)
    end
end