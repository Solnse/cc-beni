class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
     p params
     p "just herer for checking"
    #@profile = Profile.find(params[:id])
     @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end

  def add_to_profile
      if user_signed_in?
       if current_user.profile.cards.include? Card.find(params[:id])
	flash[:notice] = "Card Is Already Added To Your Profile"
       else	
       CardsProfile.create(:card_id=>params[:id],:profile_id=>current_user.profile.id)
       
       flash[:notice] = "Card Added To Your Profile"
       end 
       redirect_to :back
       else
       session[:card_id]=params[:id]
       redirect_to new_user_session_path
       end		
  end 

  def give_advice
     @profiles = Profile.request_advice
     if !params[:profile].blank?
        profile = Profile.find(params[:profile][:profile_id])
        profile.expert = params[:profile][:expert]
        profile.save
        redirect_to :back
     end
  end


end
