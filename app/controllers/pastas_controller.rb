class PastasController < ApplicationController
  before_action :set_pasta, only: %i[ show update destroy ]

  def show
    @pastas = @pasta.todas_pastas
    @midias = @pasta.midias
  end

  def create
    @pasta = Pasta.new(pasta_params)
    @pasta.origem = Pasta.find(params[:origem_id]) if params[:origem_id].present?

    respond_to do |format|
      if @pasta.save
        if params[:origem_id].present?
          format.html { redirect_to admin_pasta_url(Pasta.find(params[:origem_id])), notice: "Pasta was successfully created." }
        else
          format.html { redirect_to admin_root_path, notice: "Pasta was successfully created." }
        end
        format.json { render :show, status: :created, location: @pasta }
      else
        format.html { redirect_to admin_root_path, status: :unprocessable_entity }
        format.json { render json: @pasta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastas/1 or /pastas/1.json
  def update
    respond_to do |format|
      if @pasta.update(pasta_params)
        format.html { redirect_to admin_pasta_url(@pasta), notice: "Pasta was successfully updated." }
        format.json { render :show, status: :ok, location: @pasta }
      else
        format.html { redirect_to admin_root_path, status: :unprocessable_entity }
        format.json { render json: @pasta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastas/1 or /pastas/1.json
  def destroy
    @pasta.destroy!

    respond_to do |format|
      format.html { redirect_to pastas_url, notice: "Pasta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasta
      @pasta = Pasta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasta_params
      params.require(:pasta).permit(:nome, :link, { pasta_grupos_attributes: [:id, :grupo_id, :_destroy] })
    end
end
