class LocationProxiesController < ApplicationController
  before_action :location_proxy, only: [:show, :edit, :update, :destroy]
  before_action :location_group, only: [:index, :new, :create, :show, :destroy]

  # GET /location_proxies
  def index
    @location_proxies = LocationProxy.all
  end

  # GET /location_proxies/1
  def show
  end

  # GET /location_proxies/new
  def new
    @location_proxy = LocationProxy.new
  end

  # GET /location_proxies/1/edit
  def edit
  end

  # POST /location_proxies
  def create
    @location_proxy = LocationProxy.new(location_proxy_params)

    if @location_proxy.save
      redirect_to @location_proxy, notice: 'Location proxy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /location_proxies/1
  def update
    if @location_proxy.update(location_proxy_params)
      redirect_to @location_proxy, notice: 'Location proxy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /location_proxies/1
  def destroy
    @location_proxy.destroy
    redirect_to [@location_group, :location_proxies], notice: 'Location proxy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def location_proxy
      @location_proxy ||= LocationProxy.find(params[:id])
    end

    def location_group
      @location_group ||= LocationGroup.find_by(id: params[:location_group_id]) || location_proxy.parent
    end

    # Only allow a list of trusted parameters through.
    def location_proxy_params
      params.require(:location_proxy).permit(:position, :parent_id, :parent_type, :location_id)
    end
end
