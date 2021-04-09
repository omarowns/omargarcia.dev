class InterestGroupsController < AdminController
  before_action :set_interest_group, only: [:show, :edit, :update, :destroy]

  # GET /interest_groups
  def index
    @interest_groups = InterestGroup.all
  end

  # GET /interest_groups/1
  def show
  end

  # GET /interest_groups/new
  def new
    @interest_group = InterestGroup.new
  end

  # GET /interest_groups/1/edit
  def edit
  end

  # POST /interest_groups
  def create
    @interest_group = InterestGroup.new(interest_group_params)

    if @interest_group.save
      redirect_to @interest_group, notice: 'Interest group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interest_groups/1
  def update
    if @interest_group.update(interest_group_params)
      redirect_to @interest_group, notice: 'Interest group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interest_groups/1
  def destroy
    @interest_group.destroy
    redirect_to interest_groups_url, notice: 'Interest group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_group
      @interest_group = InterestGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interest_group_params
      params.require(:interest_group).permit(:title, :profile_id)
    end
end
