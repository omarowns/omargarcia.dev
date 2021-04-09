class InterestsController < AdminController
  before_action :interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  def index
    @interests = Interest.all
  end

  # GET /interests/1
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests
  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      redirect_to @interest, notice: 'Interest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interests/1
  def update
    if interest.update(interest_params)
      redirect_to interest, notice: 'Interest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interests/1
  def destroy
    interest.destroy
    redirect_to [helpers.interest_group, :interests], notice: 'Interest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def interest
      @interest ||= Interest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interest_params
      params.require(:interest).permit(:value, :profile_position, :interest_group_id)
    end
end
