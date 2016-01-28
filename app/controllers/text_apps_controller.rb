class TextAppsController < ApplicationController
  before_action :set_text_app, only: [:show, :edit, :update, :destroy]

  # GET /text_apps
  # GET /text_apps.json
  def index
    @text_apps = TextApp.all
  end

  # GET /text_apps/1
  # GET /text_apps/1.json
  def show
  	@key = params[:id][:phone_num]
  end

  # GET /text_apps/new
  # maps phone number and name to the database:
  def new
    @text_app = TextApp.new
  end


  # GET /text_apps/1/edit
  def edit
  end
  

  # POST /text_apps
  # POST /text_apps.json
  def create
    
    @text_app = TextApp.new(text_app_params)

    respond_to do |format|
      if @text_app.save
        format.html { redirect_to @text_app, notice: 'Text app was successfully created.' }
        format.json { render :show, status: :created, location: @text_app }
      else
        format.html { render :new }
        format.json { render json: @text_app.errors, status: :unprocessable_entity }
      end
    end
    
    
		account_sid = "PN72b767764ed66cdc6ebb96f683a60904"
		auth_token = "7b6baaf5e68b5cfcc7d989a731db89f4"
		client = Twilio::REST::Client.new account_sid, auth_token
    key = params[:id][:phone_num]
		from = "+16144271054" # My definite number
		client.account.messages.create(
    		:from => from,
    		:to => key,
    		:body => "Hey, Monkey party at 6PM. Bring Bananas!"
  		)
    end

#Post the number to the WWW
	def post

	end	
		
		
		
  # PATCH/PUT /text_apps/1
  # PATCH/PUT /text_apps/1.json
  def update
    respond_to do |format|
      if @text_app.update(text_app_params)
        format.html { redirect_to @text_app, notice: 'Text app was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_app }
      else
        format.html { render :edit }
        format.json { render json: @text_app.errors, status: :unprocessable_entity }
      end
    end    
  end

  # DELETE /text_apps/1
  # DELETE /text_apps/1.json
  def destroy
    @text_app.destroy
    respond_to do |format|
      format.html { redirect_to text_apps_url, notice: 'Text app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_app
      @text_app = TextApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_app_params
      params.require(:text_app).permit(:phone_num, :name)
    end
end
