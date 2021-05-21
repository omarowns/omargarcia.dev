class SectionsController < AdminController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:index, :new]
  before_action :load_images_for_attachments, only: [:new, :edit]

  # GET /sections
  def index
    @sections = Section.all
  end

  # GET /sections/1
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to @section, notice: 'Section was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sections/1
  def update
    if @section.update(section_params)
      redirect_to @section, notice: 'Section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sections/1
  def destroy
    @section.destroy
    redirect_to profile_sections_url(@section.profile), notice: 'Section was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(
        :profile_id,
        :type,
        translations_attributes: [
          :id,
          :title,
          :content
        ]
      )
    end

    def load_images_for_attachments
      @images = Image.all
    end
end
