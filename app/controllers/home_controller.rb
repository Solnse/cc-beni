class HomeController < ApplicationController
  
  def index
    @users = User.all
    @cards = Card.all	
  end
  
  def oldindex
    @users = User.all
    @cards = Card.all	
  end


end
