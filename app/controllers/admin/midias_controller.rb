class Admin::MidiasController < Admin::ApplicationController
  before_action :set_midia, only: %i[ show edit update destroy ]

  # GET /midias or /midias.json
  def index
    @midias = Midia.all
  end

  # GET /midias/1 or /midias/1.json
  def show
  end

  # GET /midias/new
  def new
    @midia = Midia.new
  end

  # GET /midias/1/edit
  def edit
  end

  # POST /midias or /midias.json
  def create
    @midia = Midia.new(midia_params)

    respond_to do |format|
      if @midia.save
        format.html { redirect_to midia_url(@midia), notice: "Midia was successfully created." }
        format.json { render :show, status: :created, location: @midia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @midia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /midias/1 or /midias/1.json
  def update
    respond_to do |format|
      if @midia.update(midia_params)
        format.html { redirect_to midia_url(@midia), notice: "Midia was successfully updated." }
        format.json { render :show, status: :ok, location: @midia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @midia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /midias/1 or /midias/1.json
  def destroy
    @midia.destroy!

    respond_to do |format|
      format.html { redirect_to midias_url, notice: "Midia was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_midia
      @midia = Midia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def midia_params
      params.require(:midia).permit(:arquivo, :pasta_id)
    end
end
