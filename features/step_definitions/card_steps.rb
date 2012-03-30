
### UTILITY METHODS ###
def valid_user
  @user ||= { :name => "Testy McUserton", :email => "pathakorama1@gmail.com",
    :password => "shriganesh", :password_confirmation => "shriganesh"}
end

 
def sign_in user
  visit '/users/sign_in'
  
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  click_button "Sign in"
end


def card
  @card 
end

def valid_card
  @card ||= { :card_name => 'Test Card', :card_type => 'Visa' }
end

def invalid_type
  @card ||= { :card_name => 'Test Card', :card_type => 'notacardtype' }
end

def invalid_name
  @card ||= { :card_name => '', :card_type => 'Visa' }
end

def add_card valid_card
  visit '/cards/new'
  fill_in "card_card_name", :with => card[:card_name]
  fill_in "card_card_type", :with => card[:card_type]
  click_button "Save New Card"
end
  
### Given ###

 
Given /^I am on home page$/ do
  visit '/users/sign_out'
end

Given /^I am on cards index page$/ do
   visit '/'
end

Given /^I am logged in with user$/ do
  sign_in valid_user
end

### When ###
When /^I enter valid card data$/ do
  add_card valid_card
end

When /^I enter invalid card type$/ do
  add_card invalid_type
end

When /^I enter invalid card name$/ do
  add_card invalid_name
end

When /^I Click on add vote link$/ do
   @totalupvote = Card.find(:first).total_upvotes
    p "my total votes"
    p  @totalupvote
    click_link "Add Vote"
    
end

When /^I Click on down vote link$/ do
    @totaldownvote = Card.find(:first).total_downvotes
    p "my total votes"
    p  @totaldownvote
    click_link "Down Vote"
end

When /^I again try to add same card$/ do
   select("Barclaycard",:from=>"id")
   click_button "Submit"

end


### Then ###

Then /^My Vote Count Get Increased$/ do
(@totalupvote.to_i+1).to_i.should  eql(Card.find(:first).total_upvotes.to_i)
page.should_not have_content "Total Votes Up Are - "+Card.find(:first).total_upvotes.to_s
end

Then /^My Vote Count Get Descresed$/ do
(@totaldownvote.to_i+1).to_i.should  eql(Card.find(:first).total_downvotes.to_i)
page.should_not have_content "Total Votes Down Are - "+Card.find(:first).total_downvotes.to_s
end


Then /^I should see a successful card added message$/ do
  page.should have_content "Card was successfully created"
  page.should_not have_content "Invalid card name"
  page.should_not have_content "Invalid card type"
end

Then /^I should see an invalid card type message$/ do
  page.should have_content "only allows Visa, MasterCard, Amex, or Discover"
  page.should_not have_content "Card was successfully created"
end

Then /^I should see an invalid card name message$/ do
  page.should have_content "should not be empty!"
  page.should_not have_content "Card was successfully created"
end




Then /^click on  show all cards$/ do
   click_link "Show All Cards"
end

Then /^I go To Cards Index Page$/ do
  page.should have_content "Enter The Credit Card Name"
end

Then /^I Enter Card Name For Search with visa$/ do
  
    fill_in "creditcard_name", :with => "Bank"
  
end

Then /^Click to submit button$/ do
  click_button "Submit"
end

Then /^I go to search page$/ do
  page.should have_content "Bank"
end

Then /^I Can See Vanquis Visa card name is there$/ do
  page.should have_content "Bank"
end


Then /^I select a card to get added to my profile$/ do
     visit profile_path(User.find_by_email("pathakorama1@gmail.com").id)
     select("Barclaycard",:from=>"id")
     click_button "Submit"

end

Then /^the card get added to my profile$/ do
  page.should have_content "Card Added To Your Profile"
  page.should have_content "Barclaycard"
   
end


Then /^I see a message already added$/ do
   page.should have_content "Card Is Already Added To Your Profile"
end



Then /^I enter purpose of credit card as low$/ do
     fill_in "creditcard", :with=>"Life Balance Transfers"
     click_button "Submit value"
  


end

Then /^i get a list of cards and i click to show benifits$/ do
page.should have_content "Show Benifits"   
  click_link "Show Benifits"
 
end

Then /^I should see a low word related to the search$/ do
   page.should have_content('Life Balance Transfers')  

end



When /^I Go To home page$/ do
  visit "/"
end

Then /^I click on already dont have credit card$/ do
   click_link "Already Dont Have An Credit Card"
end

Then /^i fill the information$/ do
     fill_in "profile_country", :with=>"India"	
     fill_in "profile_city", :with=>"Pune"	
     fill_in "profile_fico", :with=>"350"	
     fill_in "profile_purpose", :with=>"for grocessary and gas and gift and cash back"
     click_button "Submit"	
     
end

Then /^i logout as a normal user$/ do
  visit "/users/sign_out"
end

When /^I log in as admin user$/ do
   
 user = valid_user.merge(:email => "admin@gmail.com",:password => "admin123", :password_confirmation => "admin123")
 sign_in user
  
end

Then /^I click on send member advice$/ do
   
   click_link "Send Member Advice"

end

Then /^I fill up the particular user form$/ do
  user = User.find_by_email("pathakorama1@gmail.com")
   within("form[@id='user#{user.profile.id}']") do
      fill_in 'profile_expert', :with => 'special advice'
      click_button "Submit"	
    
    end
    
end

Then /^i logout from admin$/ do
visit "/users/sign_out"
end

When /^i login as a member$/ do
  sign_in valid_user
end

Then /^i should see the admin message$/ do
  page.should have_content('special advice')  
 
end


