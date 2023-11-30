class Admin::PastasController < Admin::ApplicationController
  before_action :set_pasta, only: %i[ show edit update destroy ]

  # GET /pastas or /pastas.json
  def index
    @pastas = Pasta.all
  end

  # GET /pastas/1 or /pastas/1.json
  def show
  end

  # GET /pastas/new
  def new
    @pasta = Pasta.new
  end

  # GET /pastas/1/edit
  def edit
  end

  # POST /pastas or /pastas.json
  def create
    @pasta = Pasta.new(pasta_params)

    respond_to do |format|
      if @pasta.save
        format.html { redirect_to pasta_url(@pasta), notice: "Pasta was successfully created." }
        format.json { render :show, status: :created, location: @pasta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pasta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastas/1 or /pastas/1.json
  def update
    respond_to do |format|
      if @pasta.update(pasta_params)
        format.html { redirect_to pasta_url(@pasta), notice: "Pasta was successfully updated." }
        format.json { render :show, status: :ok, location: @pasta }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
      params.require(:pasta).permit(:nome, :link, :origem_id, :origem_type)
    end
end
