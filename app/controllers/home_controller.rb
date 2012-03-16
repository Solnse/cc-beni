class HomeController < ApplicationController
  def index
    @users = User.all
    @cards = Card.all	
  end
end
