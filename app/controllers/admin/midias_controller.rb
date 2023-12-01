class Admin::MidiasController < Admin::ApplicationController
  before_action :set_midia, only: %i[ destroy ]

  def create
    @midia = Midia.new(midia_params)

    respond_to do |format|
      if @midia.save
        format.html { redirect_to admin_pasta_url(@midia.pasta), notice: "Midia was successfully created." }
        format.json { render :show, status: :created, location: @midia }
      else
        format.html { redirect_to admin_root_path, status: :unprocessable_entity }
        format.json { render json: @midia.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    pasta = @midia.pasta
    @midia.destroy!

    respond_to do |format|
      format.html { redirect_to admin_pasta_url(pasta), notice: "Midia was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_midia
      @midia = Midia.find(params[:id])
    end

    def midia_params
      params.require(:midia).permit(:arquivo, :pasta_id)
    end
end
