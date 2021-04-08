class ProfileImagesController < ApplicationController
  before_action :profile_image, only: [:show, :edit, :update, :destroy]
  before_action :profile, only: [:index, :new, :create, :show, :destroy]

  # GET /profile_images
  def index
    @profile_images = ProfileImage.all
  end

  # GET /profile_images/1
  def show
  end

  # GET /profile_images/new
  def new
    @profile_image = ProfileImage.new
  end

  # GET /profile_images/1/edit
  def edit
  end

  # POST /profile_images
  def create
    @profile_image = ProfileImage.new(profile_image_params)

    if @profile_image.save
      redirect_to @profile_image, notice: 'Profile image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profile_images/1
  def update
    if @profile_image.update(profile_image_params)
      redirect_to @profile_image, notice: 'Profile image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /profile_images/1
  def destroy
    @profile_image.destroy
    redirect_to [@profile, :profile_images], notice: 'Profile image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def profile_image
      @profile_image ||= ProfileImage.find(params[:id])
    end

    def profile
      @profile ||= Profile.find_by(id: params[:profile_id]) || profile_image.profile
    end

    # Only allow a list of trusted parameters through.
    def profile_image_params
      params.require(:profile_image).permit(:main, :featured, :position, :profile_id, :image_id)
    end
end
