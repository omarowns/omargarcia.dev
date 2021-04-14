class LocationProxiesController < PolymorphicController
  before_action :location_proxy, only: [:show, :edit, :update, :destroy]

  # GET /location_proxies
  def index
    @location_proxies = if @polymorphic_model
                          @polymorphic_model.location_proxies
                        else
                          LocationProxy.all
                        end
  end

  # GET /location_proxies/1
  def show
  end

  # GET /location_proxies/new
  def new
    @location_proxy = if @polymorphic_model
                        @polymorphic_model.location_proxies.new
                      else
                        LocationProxy.new
                      end
  end

  # GET /location_proxies/1/edit
  def edit
  end

  # POST /location_proxies
  def create
    @location_proxy = LocationProxy.new(location_proxy_params)

    if @location_proxy.save
      redirect_to @location_proxy.locatable, notice: 'Location proxy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /location_proxies/1
  def update
    if @location_proxy.update(location_proxy_params)
      redirect_to @location_proxy.locatable, notice: 'Location proxy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /location_proxies/1
  def destroy
    location_proxy.destroy
    redirect_to @location_proxy.locatable, notice: 'Location proxy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def location_proxy
      @location_proxy ||= LocationProxy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_proxy_params
      params.require(:location_proxy).permit(:position, :locatable_id, :locatable_type, :location_id)
    end
end
