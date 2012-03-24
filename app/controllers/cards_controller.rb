class CardsController < ApplicationController
  before_filter :check_admin ,:only=>[:edit,:destroy]
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])
    @card.tag_list = params[:card][:tag_list]
    
    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :ok }
    end
  end
 
  def search
    if !params[:creditcard].blank?
      @cards = Card.find(:all,:conditions=>["card_name like ?","%#{params[:creditcard][:name]}%"])
    
    if @cards.blank?
      flash[:notice] = "not found"  
    else
      flash[:notice] = "found"  
      render :action=> :index  and return;
    end
    end	
  end

  def find_cards_for_me
      	p params[:profession]
        p params[:purpose] 
      if !params[:profession].blank?
          
      end

  end

 

  # first create a add tag to a credit card
  #then find it here properly
  def find_cards_for_my_purchase
     @cards = Card.tagged_with(params[:creditcard])
     @cards << Card.find(:all,:conditions=>["card_name like ? ","%#{params[:creditcard]}%"])
     @cards.flatten!
     Kaminari.paginate_array(@cards).page(params[:page]).per(10)
     
      if @cards.blank?
      flash[:notice] = "not found"  
    else
      flash[:notice] = "found"  
      render :action=> :index  and return;
    end

  end

private
  def check_admin
    if current_user.has_role? :admin
    else
     flash[:notice] = "Only Admin Can Edit This" 
     redirect_to "/"

    end
  end


end

