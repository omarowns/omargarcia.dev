class AboutLinesController < AdminController
  before_action :about_line, only: [:show, :edit, :update, :destroy]
  before_action :about, only: [:index, :new, :create, :show, :destroy]

  # GET /about_lines
  def index
    @about_lines = AboutLine.all
  end

  # GET /about_lines/1
  def show
  end

  # GET /about_lines/new
  def new
    @about_line = AboutLine.new
  end

  # GET /about_lines/1/edit
  def edit
  end

  # POST /about_lines
  def create
    @about_line = AboutLine.new(about_line_params)

    if @about_line.save
      redirect_to @about_line, notice: 'About line was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /about_lines/1
  def update
    if @about_line.update(about_line_params)
      redirect_to @about_line, notice: 'About line was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /about_lines/1
  def destroy
    @about_line.destroy
    redirect_to [@about, :about_lines], notice: 'About line was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def about_line
      @about_line ||= AboutLine.find(params[:id])
    end

    def about
      @about ||= About.find_by(id: params[:about_id]) || about_line.about
    end

    # Only allow a list of trusted parameters through.
    def about_line_params
      params.require(:about_line).permit(:line, :position, :about_id)
    end
end
