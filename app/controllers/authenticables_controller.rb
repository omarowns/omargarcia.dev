class AuthenticablesController < AdminController
  before_action :set_authenticable, only: :destroy

  def destroy
    @authenticable.destroy
    redirect_to request.referrer, notice: 'Authenticable was successfully destroyed.'
  end

  private

    def set_authenticable
      @authenticable = Authenticable.find(params[:id])
    end
end
