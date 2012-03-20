class CardsProfilesController < ApplicationController
  # GET /cards_profiles
  # GET /cards_profiles.json
  def index
    @cards_profiles = CardsProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards_profiles }
    end
  end

  # GET /cards_profiles/1
  # GET /cards_profiles/1.json
  def show
    @cards_profile = CardsProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cards_profile }
    end
  end

  # GET /cards_profiles/new
  # GET /cards_profiles/new.json
  def new
    @cards_profile = CardsProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cards_profile }
    end
  end

  # GET /cards_profiles/1/edit
  def edit
    @cards_profile = CardsProfile.find(params[:id])
  end

  # POST /cards_profiles
  # POST /cards_profiles.json
  def create
    @cards_profile = CardsProfile.new(params[:cards_profile])

    respond_to do |format|
      if @cards_profile.save
        format.html { redirect_to @cards_profile, notice: 'Cards profile was successfully created.' }
        format.json { render json: @cards_profile, status: :created, location: @cards_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @cards_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards_profiles/1
  # PUT /cards_profiles/1.json
  def update
    @cards_profile = CardsProfile.find(params[:id])

    respond_to do |format|
      if @cards_profile.update_attributes(params[:cards_profile])
        format.html { redirect_to @cards_profile, notice: 'Cards profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cards_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards_profiles/1
  # DELETE /cards_profiles/1.json
  def destroy
    @cards_profile = CardsProfile.find(params[:id])
    @cards_profile.destroy

    respond_to do |format|
      format.html { redirect_to cards_profiles_url }
      format.json { head :ok }
    end
  end
end
