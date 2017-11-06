class BemvindosController < ApplicationController

  before_action :set_bemvindo, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create, :show]
  before_action :permission, only: [:index, :destroy]


  # GET /bemvindos
  # GET /bemvindos.json
  def index
   
    @test = privileges

    @bemvindos = Bemvindo.where(city: @test)



    @new = []
  
    city = { 'caceres-mt'=>'Cáceres-MT','cuiaba-mt'=>'Cuiabá-MT','tangara-mt'=>'Tangará da Serra-MT','campogrande-ms' => 'Campo Grande - MS','corumba-ms' => 'Corumbá - MS','dourados-ms' => 'Dourados - MS','jardim-ms' => 'Jardim - MS','riobrilhante-ms' => 'Rio Brilhante - MS', 'saogabrieldooeste-ms' => 'São Gabriel do Oeste - MS' }

    unless @test.blank?
      @test.each do |c|
        @new.push(c)
      end

    end

    @cities = @new.to_sentence(:last_word_connector => ' e ')

  end

  # GET /bemvindos/1
  # GET /bemvindos/1.json
  def show
    
    if(@bemvindo.birth?)
     @birth = @bemvindo.birth.to_time.strftime('%d/%m/%Y')
    else
      @birth = nil 
    end

    @city = { 'caceres-mt'=>'Cáceres-MT','cuiaba-mt'=>'Cuiabá-MT','tangara-mt'=>'Tangará da Serra-MT','campogrande-ms' => 'Campo Grande - MS','corumba-ms' => 'Corumbá - MS','dourados-ms' => 'Dourados - MS','jardim-ms' => 'Jardim - MS','riobrilhante-ms' => 'Rio Brilhante - MS', 'saogabrieldooeste-ms' => 'São Gabriel do Oeste - MS' }

    
  end

  # GET /bemvindos/new
  def new
    @bemvindo = Bemvindo.new
    



  end

  # GET /bemvindos/1/edit
  def edit
  end

  # POST /bemvindos
  # POST /bemvindos.json
  def create
    @bemvindo = Bemvindo.new(bemvindo_params)
    @user = Bemvindo.new(bemvindo_params)
      
      respond_to do |format|
        if @bemvindo.save
        
          if(@user.city == "dourados-ms")
            FormConferenceMailer.dourados_contact(@user).deliver
          elsif(@user.city == "tangara-mt")
            FormConferenceMailer.tangara_contact(@user).deliver
          else
            #Envia email ao usuário ao confirmar formulário
            FormConferenceMailer.conf_contact(@user).deliver
          end
          format.html { redirect_to @bemvindo }
          format.json { render :show, status: :created, location: @bemvindo }

        else
          format.html { render :new }
          format.json { render json: @bemvindo.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /bemvindos/1
  # PATCH/PUT /bemvindos/1.json
  def update
    respond_to do |format|
      if @bemvindo.update(bemvindo_params)
        format.html { redirect_to @bemvindo, notice: 'Seus dados foram modificados, obrigado.' }
        format.json { render :show, status: :ok, location: @bemvindo }
      else
        format.html { render :edit }
        format.json { render json: @bemvindo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bemvindos/1
  # DELETE /bemvindos/1.json
  def destroy
    @bemvindo.destroy
    respond_to do |format|
      format.html { redirect_to bemvindos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bemvindo
      @bemvindo = Bemvindo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bemvindo_params
      params.require(:bemvindo).permit(:name, :lastname, :city, :email, :comments, :birth)
    end

    def permission
      if current_user.privileges.nil?
        redirect_to root_path
      end
    end
end
