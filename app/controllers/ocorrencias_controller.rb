class OcorrenciasController < ApplicationController
  before_action :set_ocorrencia, only: [:show, :edit, :update, :destroy]

  # GET /ocorrencias
  # GET /ocorrencias.json
  def index
    @ocorrencias = Ocorrencia.all
  end

  # GET /ocorrencias/1
  # GET /ocorrencias/1.json
  def show
  end

  # GET /ocorrencias/new
  def new
    @ocorrencia = Ocorrencia.new
  end

  # GET /ocorrencias/1/edit
  def edit
  end

  # POST /ocorrencias
  # POST /ocorrencias.json
  def create
    @ocorrencia = Ocorrencia.new(ocorrencia_params)

    respond_to do |format|
      if @ocorrencia.save
        format.html { redirect_to @ocorrencia, notice: 'Ocorrencia was successfully created.' }
        format.json { render :show, status: :created, location: @ocorrencia }
      else
        format.html { render :new }
        format.json { render json: @ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocorrencias/1
  # PATCH/PUT /ocorrencias/1.json
  def update
    respond_to do |format|
      if @ocorrencia.update(ocorrencia_params)
        format.html { redirect_to @ocorrencia, notice: 'Ocorrencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @ocorrencia }
      else
        format.html { render :edit }
        format.json { render json: @ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocorrencias/1
  # DELETE /ocorrencias/1.json
  def destroy
    @ocorrencia.destroy
    respond_to do |format|
      format.html { redirect_to ocorrencias_url, notice: 'Ocorrencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocorrencia
      @ocorrencia = Ocorrencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocorrencia_params
      params.require(:ocorrencia).permit(:tipo_ocorrencia, :descricao, :nome_vitima, :logradouro, :bairro, :cidade, :estado, :nome_contato, :telefone_contato)
    end
end
