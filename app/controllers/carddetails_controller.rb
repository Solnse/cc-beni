class CarddetailsController < ApplicationController
  # GET /carddetails
  # GET /carddetails.json
  def index
    @carddetails = Carddetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carddetails }
    end
  end

  # GET /carddetails/1
  # GET /carddetails/1.json
  def show
    @carddetail = Carddetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @carddetail }
    end
  end

  # GET /carddetails/new
  # GET /carddetails/new.json
  def new
    @carddetail = Carddetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @carddetail }
    end
  end

  # GET /carddetails/1/edit
  def edit
    @carddetail = Carddetail.find(params[:id])
  end

  # POST /carddetails
  # POST /carddetails.json
  def create
   @card = Card.find(params[:card_id]) 
   @card.carddetails.new(params[:carddetail])
    
 
    @card.features.new(params[:feature])    
    respond_to do |format|
      if @card.save
        format.html { redirect_to card_path(@card), notice: 'Carddetail was successfully created.' }
        format.json { render json: @carddetail, status: :created, location: @carddetail }
      else
        format.html { render action: "new" }
        format.json { render json: @carddetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carddetails/1
  # PUT /carddetails/1.json
  def update
    @carddetail = Carddetail.find(params[:id])

    respond_to do |format|
      if @carddetail.update_attributes(params[:carddetail])
        format.html { redirect_to @carddetail, notice: 'Carddetail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @carddetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carddetails/1
  # DELETE /carddetails/1.json
  def destroy
    @carddetail = Carddetail.find(params[:id])
    @carddetail.destroy

    respond_to do |format|
      format.html { redirect_to carddetails_url }
      format.json { head :ok }
    end
  end
end
