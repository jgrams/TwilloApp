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
  	@text_app = TextApp.find(params[:id])
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
		begin
    	@text_app = TextApp.new(text_app_params)
			account_sid = "ACf74fe283ec05664c5cc922e34831d60e"
			auth_token = "7b6baaf5e68b5cfcc7d989a731db89f4"
			client = Twilio::REST::Client.new account_sid, auth_token
	  	key = @text_app.phone_num
	  	outof = "+16144271054" # My definite number
    		respond_to do |format|
      		if @text_app.save 
        		format.html { redirect_to @text_app, notice: 'Your text is on the way! Want to try another number?' }

  	      	client.account.messages.create(
    					:from => outof,
    					:to => key,
    					:body => "Hey Katie!  Hope you're having a great day!",
    					)
   	  	 	else
    	    	format.html { redirect_to '/text_apps/new', notice: 'This phone number is formatted incorrectly, try something like 555-555-5555'}
      		end
    	  end	
    rescue Twilio::REST::RequestError => e
      redirect_to '/text_apps/new'
			flash[:notice] = "Twilio didn't recognize this number. Try again."
		end

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
