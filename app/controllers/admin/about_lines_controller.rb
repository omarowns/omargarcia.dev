module Admin
  class AboutLinesController < ApplicationController
    before_action :set_about_line, only: [:show, :edit, :update, :destroy]

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
        redirect_to [:admin, @about_line], notice: 'About line was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /about_lines/1
    def update
      if @about_line.update(about_line_params)
        redirect_to [:admin, @about_line], notice: 'About line was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /about_lines/1
    def destroy
      @about_line.destroy
      redirect_to [:admin, :about_lines], notice: 'About line was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_about_line
        @about_line = AboutLine.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def about_line_params
        params.require(:about_line).permit(:line, :position, :about_id)
      end
  end

end
