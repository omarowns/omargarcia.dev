class FeatureFlagsController < AdminController
  before_action :set_feature_flag, only: [:show, :edit, :update, :destroy]

  # GET /feature_flags
  def index
    @feature_flags = FeatureFlag.all
  end

  # GET /feature_flags/1
  def show
  end

  # GET /feature_flags/new
  def new
    @feature_flag = FeatureFlag.new
  end

  # GET /feature_flags/1/edit
  def edit
  end

  # POST /feature_flags
  def create
    @feature_flag = FeatureFlag.new(feature_flag_params)

    if @feature_flag.save
      redirect_to @feature_flag, notice: 'Feature flag was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /feature_flags/1
  def update
    if @feature_flag.update(feature_flag_params)
      redirect_to @feature_flag, notice: 'Feature flag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /feature_flags/1
  def destroy
    @feature_flag.destroy
    redirect_to feature_flags_url, notice: 'Feature flag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature_flag
      @feature_flag = FeatureFlag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feature_flag_params
      params.require(:feature_flag).permit(:key, :description, :active)
    end
end
