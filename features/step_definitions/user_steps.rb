### UTILITY METHODS ###
def valid_user
  @user ||= { :name => "Testy McUserton", :email => "pathakorama1@gmail.com",
    :password => "shriganesh", :password_confirmation => "shriganesh"}
end

def sign_up user
   
  #fill_in "name", :with => user[:name]
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  fill_in "Password confirmation", :with => user[:password_confirmation]
  click_button "Sign up"
end

def sign_in user
  visit '/users/sign_in'
  
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  visit '/users/sign_up'
  page.should have_content "Sign up"
   
  sign_up valid_user
end

Given /^I exist as a user$/ do
  visit '/users/sign_up'
  page.should have_content "Sign up"
  sign_up valid_user
  visit '/users/sign_out'
end

Given /^I do not exist as a user$/ do
  #User.find(:first, :conditions => { :email => valid_user[:email] }).should be_nil
  visit '/users/sign_out'
end

### WHEN ###
When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  visit '/users/sign_up'
  page.should have_content "Sign up"
  
  sign_up valid_user
end

When /^I sign up with an invalid email$/ do
  user = valid_user.merge(:email => "notanemail")
  visit '/users/sign_up'
  page.should have_content "Sign up"
   
  sign_up user
end

When /^I sign up without a confirmed password$/ do
  user = valid_user.merge(:password_confirmation => "")
  visit "/users/sign_up"
  sign_up user
end

When /^I sign up without a password$/ do
  visit "/users/sign_up" 
  user = valid_user.merge(:password => "")
  sign_up user
end

When /^I sign up with a mismatched password confirmation$/ do
  user = valid_user.merge(:password_confirmation => "please123")
  sign_up user
end

When /^I return to the site$/ do
  visit "/"
end

When /^I sign in with a wrong password$/ do
  user = valid_user.merge(:password => "wrongpass")
  visit '/users/sign_in'
  sign_in user
end

When /^I sign in with valid credentials$/ do
#CC Beni - Managing your benefits so you don't have  
  visit '/users/sign_in'
 
 page.should have_content "Sign in"
  
    sign_in valid_user
  
end

When /^I Log in with user details$/ do
  #click_link "Logout"
 
#page.should have_content "Login"
#sign_in valid_user
# page.should have_content "Logout"
end



When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "Current password", :with => valid_user[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/users'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
#  page.should_not have_content "Sign up"
#  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
 # page.should have_content "Sign up"
 # page.should have_content "Login"
 # page.should_not have_content "Logout"
end

Then /^I should see a succesfull sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out"
end

Then /^I see an invalid login message$/ do
  #page.should have_content "Invalid"
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  page.should have_content valid_user[:name]
end
