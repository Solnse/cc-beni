class CardsController < ApplicationController
 require 'will_paginate/array'

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
   
    if params[:creditcard]
      @cards = Card.where("card_name like ?","%#{params[:creditcard][:name]}%").page(params[:page])
    end
    if @cards.blank?
      flash[:notice] = "not found"  
    else
      flash[:notice] = "Found Cards Are As Follows"  
     # render :action=> :index  and return;
    end
     
    
    	
  end

  #here i will store the user information which admin will check and send him information about which credit card is useful for him
  def find_cards_for_me
     if current_user.blank?
         flash[:notice]="Please Sign In To Get The Expert Advice For Purchasing A Credit Card" 
         redirect_to new_user_session_path and return
     end	
     @profile = current_user.profile 
     if !params[:profile].blank?	
      
      	
      current_user.profile.update_attributes(params[:profile])
      flash[:notice] = "Expert Person Will Write A Message Within 24 Houres."
      redirect_to :back
      end
  end

 

  # first create a add tag to a credit card
  #then find it here properly
  def find_cards_for_my_purchase
     p params
     p "these are params"
    # @cards = Card.tagged_with(params[:creditcard])
    # @cards << Card.includes([:features]).where("card_name like ? or features.content like ?","%#{params[:creditcard]}%","%#{params[:creditcard]}%")
     session[:creditcard] = params[:creditcard] if !params[:creditcard].blank?
     @cards = []
     session[:creditcard].split(",").each do |cr|
     @cards << Card.where("speciality like '%#{cr}%' and speciality != '' and speciality is not null").order(:created_at) 
      end
      session[:creditcard].split(",").each do |cr|
      @cards << Card.tagged_with(cr)
      end
      @cards.flatten! 
      @cards = @cards.paginate(:page => params[:page], :per_page => 10)

    if @cards.blank?
      flash[:notice] = "No Creadit Card Were Found For This Type Of Purchase"  
      redirect_to :back 
    else
      flash[:notice] = "Following Credit Cards Were Found"  
       
    end

  end

  def add_vote
      @card = Card.find(params[:id])
      @card.total_upvotes = @card.total_upvotes.to_i + 1
      @card.save
  end
  def down_vote
      @card = Card.find(params[:id])
      @card.total_downvotes = @card.total_downvotes.to_i + 1
      @card.save
      
  end


private
  def check_admin
    if  !current_user.blank? and  current_user.has_role? :admin
    else
     flash[:notice] = "Only Admin Can Edit This" 
     redirect_to "/"

    end
  end


end

