class ImageProxiesController < AdminController
  before_action :image_proxy, only: [:show, :edit, :update, :destroy]

  # GET /image_proxies
  def index
    @image_proxies = ImageProxy.all
  end

  # GET /image_proxies/1
  def show
  end

  # GET /image_proxies/new
  def new
    @image_proxy = ImageProxy.new
  end

  # GET /image_proxies/1/edit
  def edit
  end

  # POST /image_proxies
  def create
    @image_proxy = ImageProxy.new(image_proxy_params)

    if @image_proxy.save
      redirect_to @image_proxy, notice: 'Image proxy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /image_proxies/1
  def update
    if @image_proxy.update(image_proxy_params)
      redirect_to @image_proxy, notice: 'Image proxy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /image_proxies/1
  def destroy
    @image_proxy.destroy
    redirect_to image_proxies_url, notice: 'Image proxy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def image_proxy
      @image_proxy ||= ImageProxy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_proxy_params
      params.require(:image_proxy).permit(:main, :featured, :position, :imageable_id, :imageable_type, :image_id)
    end
end
